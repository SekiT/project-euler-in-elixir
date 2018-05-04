Stream.iterate({5, 5, [2, 3], 2}, fn {n, sum, primes, adder} ->
  sqrt = :math.sqrt(n)
  prime? = Enum.reduce_while(primes, true, fn
    (prime, _) when rem(n, prime) == 0 ->
      {:halt, false}
    (prime, _) when prime >= sqrt ->
      {:halt, true}
    (_, _) ->
      {:cont, true}
  end)
  if prime? do
    {n + adder, sum + n, primes ++ [n], 6 - adder}
  else
    {n + adder, sum, primes, 6 - adder}
  end
end)
|> Enum.find(fn {n, _, _, _} -> n >= 2_000_000 end)
|> case do {_, sum, _, _} -> IO.puts(sum) end

Stream.iterate({[2, 3], 5, 2}, fn {primes, n, adder} ->
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
    {primes ++ [n], n + adder, 6 - adder}
  else
    {primes, n + adder, 6 - adder}
  end
end)
|> Enum.find(fn {primes, _, _} -> length(primes) == 10_001 end)
|> case do {primes, _, _} -> IO.puts(List.last(primes)) end

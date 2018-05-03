Stream.iterate({[2, 3], 5, 2}, fn {primes, n, adder} ->
  if Enum.any?(primes, &(rem(n, &1) == 0)) do
    {primes, n + adder, 6 - adder}
  else
    {List.insert_at(primes, -1, n), n + adder, 6 - adder}
  end
end)
|> Enum.find(fn {primes, _, _} -> length(primes) == 10_001 end)
|> case do {primes, _, _} -> IO.puts(List.last(primes)) end

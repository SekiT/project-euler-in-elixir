Stream.iterate({600_851_475_143, 1, 2}, fn
  ({n, _, divisor}) when rem(n, divisor) == 0 ->
    {div(n, divisor), divisor, divisor}
  ({n, max_divisor, divisor}) ->
    next_divisor = case divisor do
      2 -> 3
      3 -> 5
      d when rem(d, 6) == 5 -> d + 2
      d when rem(d, 6) == 1 -> d + 4
    end
    {n, max_divisor, next_divisor}
end)
|> Enum.find(fn {n, _, _} -> n == 1 end)
|> case do {_, max_divisor, _} -> IO.puts(max_divisor) end

Stream.iterate({600_851_475_143, 1, 2}, fn
  ({1, _, _} = final_state) ->
    final_state
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
|> Stream.drop_while(fn {n, _, _} -> n > 1 end)
|> Enum.take(1)
|> case do [{_, max_divisor, _}] -> max_divisor end
|> IO.puts()

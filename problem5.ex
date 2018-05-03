Enum.reduce(1..20, {[], 1}, fn(n, {factors, product}) ->
  new_factor =
    Enum.reduce(factors, n, fn
      (factor, divided_n) when rem(divided_n, factor) == 0 ->
        div(divided_n, factor)
      (_, divided_n) ->
        divided_n
    end)
  {[new_factor | factors], product * new_factor}
end)
|> case do {_, product} -> IO.puts(product) end

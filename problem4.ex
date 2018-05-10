for a <- 100..999,
    b <- a..999,
    product = a * b,
    str = Integer.to_string(product),
    str == String.reverse(str) do
  product
end
|> Enum.max()
|> IO.puts()

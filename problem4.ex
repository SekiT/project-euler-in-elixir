for a <- 100..999,
    b <- 100..999 do
  a * b
end
|> Enum.filter(fn product ->
  string = Integer.to_string(product)
  string == String.reverse(string)
end)
|> Enum.max()
|> IO.puts()

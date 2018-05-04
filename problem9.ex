for a <- 1..332,
    b <- (a + 1)..499,
    c = 1000 - a - b,
    a * a + b * b == c * c do
  a * b * c
end
|> hd()
|> IO.puts()

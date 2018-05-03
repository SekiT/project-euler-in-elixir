1..20
|> Enum.reduce(fn(a, b) -> div(a * b, Integer.gcd(a, b)) end)
|> IO.puts()

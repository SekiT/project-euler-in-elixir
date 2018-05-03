sum_of_squares = fn n ->
  div(n * (n + 1) * (2 * n + 1), 6)
end
sum = fn n ->
  div(n * (n + 1), 2)
end
n = 100
s = sum.(n)
IO.puts(s * s - sum_of_squares.(n))

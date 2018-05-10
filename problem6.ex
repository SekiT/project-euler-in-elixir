n = 100
sum = div(n * (n + 1), 2)
sum_of_squares = div(n * (n + 1) * (2 * n + 1), 6)
IO.puts(sum * sum - sum_of_squares)

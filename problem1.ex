defmodule Problem1 do
  @spec sum_from_1_to(n :: pos_integer) :: pos_integer
  defp sum_from_1_to(n) do
    div(n * (n + 1), 2)
  end

  @spec sum_of_multiples(n :: pos_integer, divisor :: pos_integer) :: pos_integer
  defp sum_of_multiples(n, divisor) do
    count_of_multiples = div(n, divisor)
    divisor * sum_from_1_to(count_of_multiples)
  end

  @spec sum_of_multiples(n :: pos_integer, divisor1 :: pos_integer, divisor2 :: pos_integer) :: pos_integer
  def sum_of_multiples(1, _, _), do: 0
  def sum_of_multiples(n, divisor1, divisor2) do
    m = n - 1 # We should compute the sum of multiples *below* n
    lcm = div(divisor1 * divisor2, Integer.gcd(divisor1, divisor2))
    sum_of_multiples(m, divisor1) + sum_of_multiples(m, divisor2) - sum_of_multiples(m, lcm)
  end
end

Problem1.sum_of_multiples(1000, 3, 5)
|> IO.puts()

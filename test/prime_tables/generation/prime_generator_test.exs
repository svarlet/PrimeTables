defmodule PrimeTables.Generation.PrimeGeneratorTest do
  use ExUnit.Case, async: true
  use Quixir

  alias PrimeTables.Generation.PrimeGenerator, as: PrimeGenerator

  @max_number_of_primes 250

  test "Generating a negative number of primes is an error" do
    assert {:invalid, "Cannot generate -1 prime numbers."} == PrimeGenerator.generate(-1)
  end

  test "Generating 0 prime numbers returns an empty list" do
    assert {:ok, []} == PrimeGenerator.generate(0)
  end

  test "Generating N prime numbers generate a list of N numbers" do
    ptest n: int(min: 1, max: @max_number_of_primes) do
      {:ok, primes} = PrimeGenerator.generate(n)
      assert n == length(primes)
    end
  end

  test "Generating N prime numbers generate a list of numbers sorted in ascending order" do
    ptest n: int(min: 0, max: @max_number_of_primes) do
      {:ok, primes} = PrimeGenerator.generate(n)
      assert Enum.sort(primes) == primes
    end
  end

  test "None of the numbers between 2 primes are a prime" do
    ptest n: int(min: 2, max: @max_number_of_primes) do
      {:ok, primes} = PrimeGenerator.generate(n)
      composite_numbers = Enum.to_list(2..n) -- primes
      refute Enum.any?(composite_numbers, &is_prime?/1)
    end
  end

  defp is_prime?(x) do
    is_prime?(x, 2, trunc(:math.sqrt(x)))
  end

  defp is_prime?(_, from, until) when from > until do
    false
  end

  defp is_prime?(x, from, until) do
    case rem(x, from) do
      0 -> false
      _ -> is_prime?(x, from + 1, until)
    end
  end

  test "All primes are present only once" do
    ptest n: int(min: 0, max: @max_number_of_primes) do
      {:ok, primes} = PrimeGenerator.generate(n)
      assert length(Enum.uniq(primes)) == n
    end
  end
end

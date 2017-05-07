defmodule PrimeTables.Generation.PrimeGeneratorTest do
  use ExUnit.Case, async: true
  use Quixir

  alias PrimeTables.Generation.PrimeGenerator, as: PrimeGenerator

  test "Generating a negative number of primes is an error" do
    assert {:invalid, "Cannot generate -1 prime numbers."} == PrimeGenerator.generate(-1)
  end

  test "Generating 0 prime numbers is an error" do
    assert {:invalid, "Cannot generate 0 prime numbers."} == PrimeGenerator.generate(0)
  end

  test "Generating N prime numbers generate a list of N numbers" do
    ptest n: int(min: 1, max: 100_000) do
      {:ok, primes} = PrimeGenerator.generate(n)
      assert n == length(primes)
    end
  end

  test "Generating N prime numbers generate a list of sorted numbers" do
    ptest n: int(min: 1, max: 100_000) do
      {:ok, primes} = PrimeGenerator.generate(n)
      assert Enum.sort(primes) == primes
    end
  end
end

defmodule PrimeTables.Generation.PrimeGeneratorTest do
  use ExUnit.Case, async: true

  alias PrimeTables.Generation.PrimeGenerator, as: PrimeGenerator

  test "Generating a negative number of primes is an error" do
    assert {:invalid, "Cannot generate -1 prime numbers."} == PrimeGenerator.generate(-1)
  end

  test "Generating 0 prime numbers is an error" do
    assert {:invalid, "Cannot generate 0 prime numbers."} == PrimeGenerator.generate(0)
  end
end

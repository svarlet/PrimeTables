defmodule PrimeTables.Generation.PrimeGeneratorTest do
  use ExUnit.Case, async: true

  alias PrimeTables.Generation.PrimeGenerator, as: PrimeGenerator

  test "Generating a negative number of primes is an error" do
    assert {:invalid, "Cannot generate a negative number of primes."} == PrimeGenerator.generate(-1)
  end
end

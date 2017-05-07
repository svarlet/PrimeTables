defmodule PrimeTables.Generation.PrimeGenerator do

  def generate(n) when n < 0 do
    {:invalid, "Cannot generate a negative number of primes."}
  end
end

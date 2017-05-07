defmodule PrimeTables.Generation.PrimeGenerator do

  def generate(n) when n <= 0 do
    {:invalid, "Cannot generate #{n} prime numbers."}
  end

  def generate(n) do
    {:ok, List.duplicate(0, n)}
  end
end

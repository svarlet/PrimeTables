defmodule PrimeTables.Generation.Sieve do
  def new(), do: %{}

  def has_composite?(sieve, composite) do
    Map.has_key?(sieve, composite)
  end

  def record_prime(sieve, prime) do
    next_composite = prime * prime
    Map.put(sieve, next_composite, [{next_composite, prime}])
  end

  def reject_composite(sieve, candidate) do
    %{^candidate => iterators} = sieve
    updated_iterators = Enum.map(iterators, &bump_iterator/1)
    trimmed_sieve = Map.delete(sieve, candidate)
    Enum.reduce(updated_iterators, trimmed_sieve,
      fn {composite, _prime} = iterator, sieve ->
        Map.update(sieve, composite, [iterator], fn iterators -> [iterator | iterators] end)
      end
    )
  end

  defp bump_iterator({composite, prime}) do
    {composite + prime, prime}
  end
end

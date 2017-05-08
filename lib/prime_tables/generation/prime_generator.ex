defmodule PrimeTables.Generation.PrimeGenerator do

  alias PrimeTables.Generation.Sieve

  def generate(n) when n < 0 do
    {:invalid, "Cannot generate #{n} prime numbers."}
  end

  def generate(n) do
    primes = []
    candidate = 2
    sieve = Sieve.new
    generate(n, primes, candidate, sieve)
  end

  defp generate(0, primes, _, _) do
    {:ok, Enum.reverse(primes)}
  end

  defp generate(n, primes, candidate, sieve) do
    if (Map.has_key?(sieve, candidate)) do
        updated_sieve = update_iterators(sieve, candidate)
        generate(n, primes, candidate + 1, updated_sieve)
    else
        updated_sieve = Sieve.record_prime(sieve, candidate)
        generate(n - 1, [candidate | primes], candidate + 1, updated_sieve)
    end
  end

  defp update_iterators(sieve, candidate) do
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

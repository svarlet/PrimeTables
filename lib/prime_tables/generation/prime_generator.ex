defmodule PrimeTables.Generation.PrimeGenerator do

  def generate(n) when n < 0 do
    {:invalid, "Cannot generate #{n} prime numbers."}
  end

  def generate(0) do
    {:ok, []}
  end

  def generate(n) do
    primes = []
    candidate = 2
    sieve = %{}
    generate(n, primes, candidate, sieve)
  end

  defp generate(0, primes, _, _) do
    {:ok, Enum.reverse(primes)}
  end

  defp generate(n, primes, candidate, sieve) do
    case sieve do
      %{^candidate => _iterators} ->
        updated_sieve = update_iterators(sieve, candidate)
        generate(n, primes, candidate + 1, updated_sieve)
      _ ->
        updated_sieve = record_prime(sieve, candidate)
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

  defp record_prime(sieve, prime) do
    {next_composite, prime} = new_iterator(prime)
    Map.put(sieve, next_composite, [{next_composite, prime}])
  end

  defp new_iterator(prime) do
    next_composite_for_prime = prime * prime
    {next_composite_for_prime, prime}
  end

  defp bump_iterator({composite, prime}) do
    {composite + prime, prime}
  end

end

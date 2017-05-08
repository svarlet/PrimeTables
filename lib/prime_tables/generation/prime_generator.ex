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
    if (Sieve.has_composite?(sieve, candidate)) do
        updated_sieve = Sieve.reject_composite(sieve, candidate)
        generate(n, primes, candidate + 1, updated_sieve)
    else
        updated_sieve = Sieve.record_prime(sieve, candidate)
        generate(n - 1, [candidate | primes], candidate + 1, updated_sieve)
    end
  end

end

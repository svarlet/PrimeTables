defmodule PrimeTables do

  alias PrimeTables.Generation.PrimeGenerator, as: PrimeGenerator

  @column_separator " | "

  def main(args) do
    args
    |> parse_args
    |> process
  end

  defp parse_args(args) do
    case OptionParser.parse(args, aliases: [n: :number], strict: [number: :integer]) do
      {[number: n_primes], [], []} -> {:ok, n_primes}
      _ -> {:error, :show_usage}
    end
  end

  defp process({:error, :show_usage}) do
    """
    Usage
    =====
    ./prime_table -n [number_of_primes]
    """
    |> IO.puts
  end

  defp process({:ok, n_primes}) do
    n_primes
    |> PrimeGenerator.generate
    |> print_table
  end

  defp print_table({:error, message}) do
    IO.puts message
  end

  defp print_table({:ok, []}) do
    IO.puts "No primes were found."
  end

  defp print_table({:ok, primes}) do
    last_prime = List.last(primes)
    column_width = String.length("#{last_prime * last_prime}")

    display_row(" ", column_width, primes)

    for p <- primes do
      display_row("#{p}", column_width, Enum.map(primes, &(&1 * p)))
    end
  end

  defp display_row(prefix, desired_length, numbers) do
    values = Enum.map(numbers, &("#{&1}"))
    [prefix | values]
    |> Enum.map(fn item -> pad(item, desired_length) end)
    |> Enum.join(@column_separator)
    |> IO.puts
  end

  defp pad(string, desired_length) do
    required_spaces = desired_length - String.length(string)
    String.duplicate(" ", required_spaces) <> string
  end
end

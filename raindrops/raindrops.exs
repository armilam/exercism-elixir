defmodule Raindrops do

  @raindrop_values %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case raindrops(number) do
      "" -> Integer.to_string(number)
      drops -> drops
    end
  end

  def raindrops(number) do
    Enum.map_join(Dict.keys(@raindrop_values), "", fn(divisor) -> raindrop(number, divisor) end)
  end

  def raindrop(number, divisor) do
    case rem(number, divisor) do
      0 -> @raindrop_values[divisor]
      _ -> ""
    end
  end
end

defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      String.match?(input, ~r/[[:alpha:]]/) && String.upcase(input) == input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end

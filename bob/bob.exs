defmodule Bob do
  def hey(input) do
    cond do
      said_nothing?(input) -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def said_nothing?(input) do
    String.trim(input) == ""
  end

  def question?(input) do
    String.ends_with?(input, "?")
  end

  def shouting?(input) do
    String.match?(input, ~r/[[:alpha:]]/) && String.upcase(input) == input
  end
end

defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.upcase(elem(reduce_acronym(string), 1))
  end

  def reduce_acronym(string) do
    Enum.map_reduce(String.split(string), "", fn(word, acronym) -> {word, acronym <> word_acronym(word)} end)
  end

  def word_acronym(word) do
    Enum.reduce(List.flatten(Regex.scan(~r/^.|[A-Z]/, word)), fn(letter, letters) -> letters <> letter end)
  end
end

defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    count(String.split(sentence, ~r/[\s_!&@$%^&:,]/), %{})
  end

  def count([], word_counts) do
    word_counts
  end

  def count(["" | rest], word_counts) do
    count(rest, word_counts)
  end

  def count([word | rest], word_counts) do
    count(rest, Map.update(word_counts, String.downcase(word), 1, &(&1 + 1)))
  end
end

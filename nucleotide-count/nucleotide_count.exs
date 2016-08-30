defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  def validate_nucleotide(nucleotide) do
    unless Enum.member?([?A, ?T, ?C, ?G], nucleotide) do
      raise ArgumentError
    end
  end

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate_nucleotide(nucleotide)
    count(strand, nucleotide, 0)
  end

  def count([nucleotide | strand], nucleotide, total) do
    count(strand, nucleotide, total + 1)
  end

  def count([unmatched_nucleotide | strand], nucleotide, total) do
    validate_nucleotide(unmatched_nucleotide)
    count(strand, nucleotide, total)
  end

  def count([], nucleotide, total) do
    total
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do 
    histogram(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0})
  end

  def histogram([nucleotide | strand], hist) do
    validate_nucleotide(nucleotide)
    histogram(strand, increment_histogram(hist, nucleotide))
  end

  def histogram([], hist) do
    hist
  end

  def increment_histogram(hist, nucleotide) do
    %{hist | nucleotide => hist[nucleotide] + 1}
  end
end

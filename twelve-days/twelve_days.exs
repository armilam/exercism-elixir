defmodule TwelveDays do
  @days %{
     1 => %{ordinal: "first",    gift: "a Partridge in a Pear Tree."},
     2 => %{ordinal: "second",   gift: "two Turtle Doves"},
     3 => %{ordinal: "third",    gift: "three French Hens"},
     4 => %{ordinal: "fourth",   gift: "four Calling Birds"},
     5 => %{ordinal: "fifth",    gift: "five Gold Rings"},
     6 => %{ordinal: "sixth",    gift: "six Geese-a-Laying"},
     7 => %{ordinal: "seventh",  gift: "seven Swans-a-Swimming"},
     8 => %{ordinal: "eighth",   gift: "eight Maids-a-Milking"},
     9 => %{ordinal: "ninth",    gift: "nine Ladies Dancing"},
    10 => %{ordinal: "tenth",    gift: "ten Lords-a-Leaping"},
    11 => %{ordinal: "eleventh", gift: "eleven Pipers Piping"},
    12 => %{ordinal: "twelfth",  gift: "twelve Drummers Drumming"}
  }

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    strings = ["On the #{@days[number].ordinal} day of Christmas my true love gave to me"]

    gifts = case number do
      1 -> [@days[1].gift]
      _ -> (number..2
           |> Enum.map(fn(month) -> @days[month].gift end))
           ++ ["and #{@days[1].gift}"]
    end

    (strings ++ gifts)
    |> Enum.join(", ")
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map(fn(number) -> verse(number) end)
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end

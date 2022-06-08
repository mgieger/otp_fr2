defmodule Enigma.Game.Score do

  defstruct [:red, :white]

  def new(answer, attempt) do
    reds =
      answer
      |> Enum.zip(attempt)
      |> Enum.filter(fn {a, g} -> a == g end)
      |> Enum.count

    misses = attempt -- answer
    whites = Enum.count(answer) - reds - Enum.count(misses)
    %__MODULE__{red: reds, white: whites}
  end

  def show(%__MODULE__{red: reds, white: whites}) do
    String.duplicate("R", reds) <> String.duplicate("W", whites)
  end

  def render(answer, attempt) do
    answer |> new(attempt) |> show
  end
end

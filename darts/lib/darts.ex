defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    x = abs(x / 1.0)
    y = abs(y / 1.0)
    cond do
      Float.pow(x, 2) + Float.pow(y, 2) > Integer.pow(10, 2) -> 0
      Float.pow(x, 2) + Float.pow(y, 2) > Integer.pow(5, 2) -> 1
      Float.pow(x, 2) + Float.pow(y, 2) > Integer.pow(1, 2) -> 5
      true -> 10
    end
  end
end

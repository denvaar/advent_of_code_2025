defmodule Dial do
  def twist_left(state, 0), do: state
  def twist_left({passw, 0}, n), do: twist_left({passw + 1, 99}, max(0, n - 1))
  def twist_left({passw, 1}, n), do: twist_left({passw, 0}, max(0, n - 1))

  def twist_left({passw, current}, n) do
    twist_left({passw, current - 1}, max(0, n - 1))
  end

  def twist_right(state, 0), do: state
  def twist_right({passw, 0}, n), do: twist_right({passw + 1, 1}, max(0, n - 1))
  def twist_right({passw, 99}, n), do: twist_right({passw, 0}, max(0, n - 1))

  def twist_right({passw, current}, n) do
    twist_right({passw, current + 1}, max(0, n - 1))
  end
end

"../input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.reduce({0, 50}, fn
  <<"L", num::binary>>, state ->
    Dial.twist_left(state, String.to_integer(num))

  <<"R", num::binary>>, state ->
    Dial.twist_right(state, String.to_integer(num))
end)
|> elem(0)
|> IO.inspect()

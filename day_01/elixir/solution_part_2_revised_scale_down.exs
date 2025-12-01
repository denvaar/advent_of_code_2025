scale_down_factor = 2

"../input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.reduce({0, 50 / scale_down_factor}, fn
  <<"L", n_clicks::binary>>, {passw, pos} ->
    n_clicks = String.to_integer(n_clicks) / scale_down_factor
    new_pos = pos - n_clicks

    passw =
      passw +
        Enum.count(
          (floor(pos) - 1)..floor(new_pos)//-1,
          &(rem(&1, div(100, scale_down_factor)) == 0)
        )

    {passw, new_pos}

  <<"R", n_clicks::binary>>, {passw, pos} ->
    n_clicks = String.to_integer(n_clicks) / scale_down_factor
    new_pos = pos + n_clicks

    passw =
      passw +
        Enum.count((floor(pos) + 1)..floor(new_pos), &(rem(&1, div(100, scale_down_factor)) == 0))

    {passw, new_pos}
end)
|> elem(0)
|> IO.inspect()

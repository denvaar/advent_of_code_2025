"../input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.reduce({0, 50}, fn
  <<"L", n_clicks::binary>>, {passw, pos} ->
    n_clicks = String.to_integer(n_clicks)
    new_pos = pos - n_clicks
    passw = passw + Enum.count((pos - 1)..new_pos//-1, &(rem(&1, 100) == 0))
    {passw, new_pos}

  <<"R", n_clicks::binary>>, {passw, pos} ->
    n_clicks = String.to_integer(n_clicks)
    new_pos = pos + n_clicks
    passw = passw + Enum.count((pos + 1)..new_pos, &(rem(&1, 100) == 0))
    {passw, new_pos}
end)
|> elem(0)
|> IO.inspect()

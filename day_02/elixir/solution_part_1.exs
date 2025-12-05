"../input.txt"
|> File.read!()
|> String.trim()
|> String.split(",", trim: true)
|> Enum.map(fn range ->
  range
  |> String.split("-", trim: true)
  |> then(fn [a, b] -> Range.new(String.to_integer(a), String.to_integer(b)) end)
  |> Enum.map(&"#{&1}")
  |> Enum.filter(fn n_str ->
    half_length = div(String.length(n_str), 2)
    n_str_split = String.split_at(n_str, half_length)

    case half_length do
      0 -> false
      1 -> match?({<<a>>, <<a>>}, n_str_split)
      2 -> match?({<<a, b>>, <<a, b>>}, n_str_split)
      3 -> match?({<<a, b, c>>, <<a, b, c>>}, n_str_split)
      4 -> match?({<<a, b, c, d>>, <<a, b, c, d>>}, n_str_split)
      5 -> match?({<<a, b, c, d, e>>, <<a, b, c, d, e>>}, n_str_split)
      6 -> match?({<<a, b, c, d, e, f>>, <<a, b, c, d, e, f>>}, n_str_split)
      7 -> match?({<<a, b, c, d, e, f, g>>, <<a, b, c, d, e, f, g>>}, n_str_split)
    end
  end)
end)
|> List.flatten()
|> Enum.map(&String.to_integer/1)
|> Enum.sum()
|> IO.inspect(limit: :infinity)

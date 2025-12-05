"../input.txt"
|> File.read!()
|> String.trim()
|> String.split(",", trim: true)
|> Enum.map(fn range ->
  range
  |> String.split("-", trim: true)
  |> then(fn [a, b] -> Range.new(String.to_integer(a), String.to_integer(b)) end)
  |> Enum.filter(fn n ->
    case Integer.digits(n) do
      [a, a] -> true
      [a, a, a] -> true
      [a, a, a, a] -> true
      [a, a, a, a, a] -> true
      [a, a, a, a, a, a] -> true
      [a, a, a, a, a, a, a] -> true
      [a, b, a, b] -> true
      [a, b, a, b, a, b] -> true
      [a, b, a, b, a, b, a, b] -> true
      [a, b, a, b, a, b, a, b, a, b] -> true
      [a, b, c, a, b, c] -> true
      [a, b, c, a, b, c, a, b, c] -> true
      [a, b, c, d, e, a, b, c, d, e] -> true
      [a, a, b, b, c, a, a, b, b, c] -> true
      [a, b, c, d, a, b, c, d] -> true
      _ -> false
    end
  end)
end)
|> List.flatten()
|> Enum.sum()
|> IO.inspect(charlists: :as_lists, limit: :infinity)

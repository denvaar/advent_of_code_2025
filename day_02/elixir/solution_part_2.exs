"../input.txt"
|> File.read!()
|> String.trim()
|> String.split(",", trim: true)
|> Enum.map(fn range ->
  range
  |> String.split("-", trim: true)
  |> then(fn [a, b] -> Range.new(String.to_integer(a), String.to_integer(b)) end)
  |> Enum.filter(fn n ->
    n = Integer.digits(n)
    middle = div(Enum.count(n), 2)

    2..(middle + 1)
    |> Enum.map(&Enum.chunk_every(n, &1))
    |> Enum.filter(fn
      [[a, a, b], [a, a, b]] -> true
      [[a, a], [a, a], [a, a], [a]] -> true
      [[a, a], [a, a], [a]] -> true
      [[a, a], [a, a]] -> true
      [[a, a], [a]] -> true
      [[a, a]] -> true
      [[a, b, a], [a, b, a]] -> true
      [[a, b, c, d, e], [a, b, c, d, e]] -> true
      [[a, b, c, d], [a, b, c, d], [a, b, c, d]] -> true
      [[a, b, c, d], [a, b, c, d]] -> true
      [[a, b, c], [a, b, c], [a, b, c], [a, b, c]] -> true
      [[a, b, c], [a, b, c], [a, b, c]] -> true
      [[a, b, c], [a, b, c]] -> true
      [[a, b], [a, b], [a, b], [a, b], [a, b], [a, b]] -> true
      [[a, b], [a, b], [a, b], [a, b], [a, b]] -> true
      [[a, b], [a, b], [a, b]] -> true
      [[a, b], [a, b]] -> true
      _ -> false
    end)
    |> List.flatten()
    |> then(fn
      [] -> false
      _ -> true
    end)
  end)
end)
|> List.flatten()
|> Enum.sum()
|> IO.inspect(charlists: :as_lists, limit: :infinity)

defmodule Ms.Helpers do
  @moduledoc false

  def unit(list) do
    list ++ Enum.map(list, &Atom.to_string/1)
  end

  def inspect_unit(list) do
    list
    |> Enum.filter(&is_binary/1)
    |> Enum.reverse()
    |> Enum.map_join(", ", &"`#{&1}`")
  end
end

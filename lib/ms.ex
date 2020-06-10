defmodule Ms do
  import Ms.Helpers

  @s 1000
  @m @s * 60
  @h @m * 60
  @d @h * 24
  @w @d * 7
  @y @d * 365

  @second unit(~w[s sec second seconds]a)
  @minute unit(~w[m min minute minutes]a)
  @hour unit(~w[h hr hrs hour hours]a)
  @day unit(~w[d day days]a)
  @week unit(~w[w week weeks]a)
  @year unit(~w[y yr yrs year years]a)

  @moduledoc """
  A tiny millisecond conversion utility.

  ## Examples

      iex> import Ms
      iex> ms("1s")
      1000
      iex> ms("10 seconds")
      10000
      iex> ms({10, :second})
      10000

  ## Units

  | second: | #{inspect_unit(@second)} |
  | minute: | #{inspect_unit(@minute)} |
  | hour:   | #{inspect_unit(@hour)}   |
  | day:    | #{inspect_unit(@day)}    |
  | week:   | #{inspect_unit(@week)}   |
  | year:   | #{inspect_unit(@year)}   |
  """

  @spec ms(integer() | float() | binary() | {integer(), atom()} | {integer(), binary()}) ::
          integer()
  @doc """
  Converts the argument into milliseconds.
  """
  def ms(val) when is_integer(val) or is_float(val), do: trunc(val)

  def ms(val) when is_binary(val) do
    case Float.parse(val) do
      {val, ""} -> ms(val)
      {val, unit} -> ms({val, String.trim_leading(unit)})
      :error -> :error
    end
  end

  def ms({val, unit}) when unit in @second, do: trunc(val * @s)
  def ms({val, unit}) when unit in @minute, do: trunc(val * @m)
  def ms({val, unit}) when unit in @hour, do: trunc(val * @h)
  def ms({val, unit}) when unit in @day, do: trunc(val * @d)
  def ms({val, unit}) when unit in @week, do: trunc(val * @w)
  def ms({val, unit}) when unit in @year, do: trunc(val * @y)

  def ms(_), do: :error
end

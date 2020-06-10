# Ms

![CI](https://github.com/nmbrone/ms/workflows/CI/badge.svg)

A tiny millisecond conversion utility for elixir.

## Examples

```elixir
import Ms

ms("1s") # 1000
ms("2 seconds") # 2000
ms({1, :second}) # 1000
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ms` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ms, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ms](https://hexdocs.pm/ms).


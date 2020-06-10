defmodule MsTest do
  use ExUnit.Case
  doctest Ms

  import Ms

  describe "ms/1" do
    test "parses milliseconds by default" do
      assert 1 = ms(1)
      assert 1 = ms(1.5)
      assert 1 = ms("1")
      assert 1 = ms("1.5")
    end

    test "parses seconds" do
      assert 1_000 = ms("1s")
      assert 1_000 = ms("1 s")
      assert 1_000 = ms("1sec")
      assert 1_500 = ms({1.5, :s})
    end

    test "parses minutes" do
      assert 60_000 = ms("1m")
      assert 60_000 = ms({1, :minute})
    end

    test "parses hours" do
      assert 3_600_000 = ms("1h")
      assert 3_600_000 = ms({1, :hour})
    end

    test "parses days" do
      assert 86_400_000 = ms("1d")
      assert 86_400_000 = ms({1, :day})
    end

    test "parses weeks" do
      assert 604_800_000 = ms("1w")
      assert 604_800_000 = ms({1, :week})
    end

    test "parses years" do
      assert 31_536_000_000 = ms("1y")
      assert 31_536_000_000 = ms({1, :year})
    end

    test "returns `:error` for the unknown values" do
      assert :error = ms(nil)
      assert :error = ms("")
    end
  end
end

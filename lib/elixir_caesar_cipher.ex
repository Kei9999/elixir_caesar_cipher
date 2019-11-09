defmodule ElixirCaesarCipher do

  def invalid_input_phrase(), do: "Invalid input!"

  def main(args \\ []) do
    args
    |> parse_args
    |> solve_caesar_cipher
    |> IO.puts()
  end

  def parse_args(args) do
    {opts, target, _} =
      args
      |> OptionParser.parse(switches: [number: :integer])

    {opts, List.to_string(target)}
  end

  def make_valid_number(number) do
    number =
      cond do
        number <= -26 -> number + 26
        number < 0 and number > -26  -> 26 + number
        number > 25 -> number - 26
        true -> number
      end
    cond do
      number >= 0 and number <= 25 -> number
      true -> make_valid_number(number)
    end
  end

  def solve_caesar_cipher({_opts,""}), do: invalid_input_phrase()
  def solve_caesar_cipher({opts, target}) do
    number = if Keyword.has_key?(opts, :number), do: opts[:number], else: 0
    number = number |> make_valid_number()

    target = target |> String.codepoints()

    cond do
      is_english?(target) ->
        target
        |> Enum.map(
          fn(target_letter) ->
            <<aacute::utf8>> = target_letter
            new_letter = <<aacute + number ::utf8>>
            case is_english_letter?(new_letter) do
              true -> new_letter
              false -> <<aacute + number - 26 ::utf8>>
            end
          end)
        |> List.to_string()
      true ->
        invalid_input_phrase()
    end
  end


  def is_english?(words) do  #入力が英文字のみの文字列か判断する
    Enum.all?(words,
      fn(target_letter) -> is_english_letter?(target_letter)
      end)
  end

  def is_english_letter?(target_letter) do
    <<aacute::utf8>> = target_letter
    (aacute >= 65 and aacute <= 90) or (aacute >= 97 and aacute <= 122)
  end
end

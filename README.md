# ElixirCaesarCipher

シーザー暗号を解くプログラムです。
引数として対象の文字列、ずらしたい分の数字を入力してください。
負の数を指定することで逆方向にもずらすことができます。
英語以外の文字列の入力は無視するようになってます。

# Get started

Elixir 1.4系での動作を確認しています。
以下の公式ページを参考にElixirをinstallしてください。

[Elixir をインストール](https://elixir-lang.jp/install.html)

# Example
```
$./elixir_caesar_cipher "az" --number 5
fe
$./elixir_caesar_cipher "az{}az" --number 5
fe{}fe
```


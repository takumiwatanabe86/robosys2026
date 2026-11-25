# robosys2026
このリポジトリはロボットシステム学の授業で使用するリポジトリで[>

# plusコマンド
![test](https://github.com/Takumi Watanabe/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ数字を足す。

使用例

```bash
seq 5 | ./plus
```

実行結果：

```text
15
```

## cutnumberコマンド

標準入力から数値を1行ずつ読み込み、指定した桁で丸めて標準出力に表示するコマンドです。

デフォルトでは百の位で四捨五入します。

使用例

```bash
echo 1234 | ./cutnumber
```

実行結果：

```text
1200
```

### オプション

| オプション | 説明 |
|---|---|
| `-p` | 丸める桁を指定する（デフォルト：2） |
| `-m half_up` | 四捨五入する（デフォルト） |
| `-m ceil` | 切り上げる |
| `-m floor` | 切り捨てる |

### エラー処理

数値以外のデータが入力された場合、エラーメッセージを標準エラー出力に表示し、終了ステータス1を返します。


## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.10〜3.14

## テスト環境
- Ubuntu 24.04 LTS

## テスト方法

plusコマンドとcutnumberコマンドのテストは、以下のコマンドで実行できます。

```bash
bash test.bash
bash test_cutnumber.bash
```

## 著作権とLICENSE
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードは、下記のスライド（CC BY-SA 4.0 by Taro Suzuki）のものを、
  本人の許可を得て自身の著作としたものです。
    - https://github.com/tarolab-cit/lectures/tree/main/robosys2026
- © 2026 Takumi Watanabe

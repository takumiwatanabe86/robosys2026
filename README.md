# robosys2026
このリポジトリはロボットシステム学の授業で使用するリポジトリです。

## plusコマンド
![test](https://github.com/takumiwatanabe86/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ数字を足し合わせて出力するコマンドです。

使用例

```bash
$ seq 5 | ./plus
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
$ echo 1234 | ./cutnumber
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
| `-m ceil` | プラス方向に切り上げる |
| `-m floor` | マイナス方向に切り下げる |

### 丸める桁の指定

`-p` オプションで丸める桁を指定できます。

- `-p 2`：百の位
- `-p 1`：十の位
- `-p 0`：一の位
- `-p -1`：小数第一位

使用例：

```bash
$ echo 1234 | ./cutnumber -p 1
```

実行結果：

```text
1230
```

### 丸め方の指定

`-m` オプションで丸め方を指定できます。

- `half_up`：四捨五入
- `ceil`：プラス方向に切り上げ
- `floor`：マイナス方向に切り下げ

使用例：

```bash
$ echo 1234 | ./cutnumber -m ceil
```

実行結果：

```text
1300
```

```bash
$ echo 1234 | ./cutnumber -m floor
```

実行結果：

```text
1200
```

### パイプでの使用例

他のコマンドの出力をパイプで受け取り、複数の数値を処理できます。

```bash
$ seq 1 5 | ./cutnumber -p 0
```

実行結果：

```text
1
2
3
4
5
```

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
$ bash test.bash
$ bash test_cutnumber.bash
```

## 著作権とLICENSE
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードは、下記のスライド（CC BY-SA 4.0 by Taro Suzuki）のものを、本人の許可を得て自身の著作としたものです。
    - https://github.com/tarolab-cit/lectures/tree/main/robosys2026
- © 2026 Takumi Watanabe

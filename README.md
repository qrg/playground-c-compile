# C言語コンパイルをステップごとに見てみる

gcc によるコンパイルを冗長に試して、各過程で出力されるファイルがどう変化するかを眺める。

## 1. Preprocessing

プリプロセッサが、コード中のディレクティブ (#include, #defineなど) を処理する。

- ヘッダーファイルの内容をソースコードにインライン展開する
- マクロ定義 `#define` を展開する
- 条件コンパイル `#ifdef` `#ifndef` などを評価する
- ヘッダーファイルは慣例的に `include/` に配置することが多いのでこれに倣う

### 出力

プリプロセスされたCコード `<file>.i`

- この中間 (intermediate) ファイルは通常は削除される
- `gcc -E` で確認できる

```bash
# Only run the preprocessor
gcc -E source.c -o output.i
```

## 2. Compilation

プリプロセス済みのCコードをアセンブリ言語に変換する。

- 構文解析 -> ASTを生成 -> 最適化 -> アセンブリ言語に変換する

### 出力

- アセンブリコード `<file>.s`
- この中間ファイルは通常は削除される
- `gcc -S` で確認できる

```bash
# Only run preprocess and compilation steps
gcc -S input.i -o output.s
```

## 3. Assembly

アセンブリコードをバイナリ形式のオブジェクトファイルに変換する。

- CPU やアーキテクチャに依存した機械語に変換する
- オブジェクトファイルはコードの各部分 (関数, 変数) に対応する低レベル表現を持っている

### 出力

- オブジェクトファイル `<file>.o`

```bash
# Only run preprocess, compile, and assemble steps
gcc -c input.s -o output.o
```

## 4. Linking

複数のオブジェクトファイルやライブラリを結合し、最終的な実行可能ファイルを生成する。

- すべての外部参照 (関数, 変数) を解決する
- 必要に応じて標準ライブラリ (libc など) やユーザー定義ライブラリをリンクする

### 出力

- 実行可能ファイル `<file>`

```bash
# Write output to <file>
gcc -o <file> input1.o input2.o ...
```

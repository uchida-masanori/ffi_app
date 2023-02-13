
各案件では削除してよい部分

----------------------------------

# 初期設定済みプロジェクト

## プロジェクト作成方法（FVM前提）

プロジェクトは以下で作成している。  
※fvm前提  
※大本はFlutterバージョン「3.3.9」で作成

```console
$ fvm use stable --force

$ fvm flutter create \
  --org jp.co.docodoor \
  app
```

## 利用方法  

### 各種書き換え
  
本プロジェクトを`clone`後以下を案件ごとに書き換える。  
  
### アプリ名称
「アプリ名」で検索して、正しいアプリ名に置換  
  
### パッケージ名（bundle Id Application ID）の変更
  
※プロジェクト直下で実行すること
  
```console
$ chmod 755 change_package_name.sh 
```
  
パッケージ名を引数とすると、変更が必要な箇所全て書き換わる。  
例) 「com.example.app」の場合  
  
```console
$ ./change_package_name.sh com.example.app
```
  
※注意  
**元々のパッケージ名と近い内容で変更しようとすると、フォルダを再作成時に余計なファイルまで削除してしまいます。**  
例)
`jp.co.xxx.app` から `jp.co.yyy.app`の変更など  
回避策として、全く違うパッケージ名に変更してからの処理してください。  
  
```console
$ ./change_package_name.sh xxx.yyyy.bbb
$ ./change_package_name.sh com.example.app
```
  
処理が終わったら`change_package_name.sh`は消しておいてもいいかと思う。  
  
## Flutterバージョン
Flutterのバージョンを変更したい場合は[fvm_config.json](.fvm/fvm_config.json)を変更する。  

## Githubの設定

- 案件のリポジトリを作成
- remote urlを案件のリポジトリに変更。

```console
# 現在のremote url を確認
$ git remote -v
# remote url を変更
$ git remote set-url origin {new-url}
# 正しく変更できているか確認
$ git remote -v
```
  
あとは新しいリポジトリにpushできればOK  
  
  
以下README雛形

----------------------------------

## 案件概要記載

公式サイトのURL
バックログのURL

## 環境構築

fvmとVSCodeの利用を想定している。  
VSCode用の設定は追加済みである。  

**Flutter SDK**  

- バージョン管理ツール : [FVM](https://fvm.app/)
    - FVMのインストール・設定については、[こちらの記事](https://zenn.dev/riscait/articles/flutter-version-management)が参考になります。
    - ※ 私は`Homebrew`でインストールしています。
- 使用しているバージョンは .fvm/fvm_config.json に記載されています。
- FVMのインストール後、以下の流れで環境構築を実施。
    - プロジェクトのルートディレクトリで、`fvm flutter --version`を実行すると、ローカル環境に該当のバージョンがなければインストールされる。
    - VSCode の場合
        - VSCode を再起動する
        - main.dart などの dart ファイルを開き、エディタの右下の「Dart」部分をクリックして、該当のバージョンのFlutterが読み込まれていればOK

### 環境分け
環境は以下を参考に`dev`（開発）と`prod`（本番）で分けています。  
[FlutterでDart-defineのみを使って開発環境と本番環境を分ける](https://zenn.dev/riscait/articles/separating-environments-in-flutter) 
  
iOSのbuildを実行するため、以下のスクリプトに実行権限を与えてください。  
```console
$ chmod 755 ios/script/retrieve_dart_defines.sh
```

## 実行・ビルド方法

開発環境の実行コマンド  
```console
$ fvm flutter run --debug --dart-define=FLAVOR=dev
```
  
本番環境の実行コマンド
```console
$ fvm flutter run --debug --dart-define=FLAVOR=prod
```

ビルドコマンド
```console
# Android
$ flutter build appbundle --release --dart-define=FLAVOR=prod
# iOS
$ flutter build ipa --dart-define=FLAVOR=prod
```

## 構成図

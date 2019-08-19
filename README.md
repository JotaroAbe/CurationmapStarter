# CurationmapStarter

## はじめに

このリポジトリは、[キュレーションマップシステム](https://github.com/JotaroAbe/CurationmapGenerator)の一部です。

## 動作要件

- Docker
- Docker-compose
- Dockerをsudoなしで実行できるユーザ

### Dockerをsudoなしで実行する方法

dockerグループに自分のユーザを追加して再起動

```shell
sudo groupadd docker
sudo usermod -g docker yourusername
sudo /bin/systemctl restart docker.service

sudo reboot
```

## コンテナ構成

- webapp
  - [CurationmapViewer](https://github.com/JotaroAbe/CurationmapViewer)
  - Webサーバ
  - データベースを参照し、ブラウザ上にキュレーションマップを表示
- mongo
  - MongoDB
  - キュレーションマップデータは全てここに格納
- factory
  - [CurationmapFactory](https://github.com/JotaroAbe/CurationmapFactory)
  - キュレーションマップ生成
  - 検索エンジンを用いて文書を収集、解析する

## 使用方法

1. このリポジトリをクローンしてください。

   ```shell
   git clone git@github.com:JotaroAbe/CurationmapStarter.git
   ```

2. リポジトリ直下でinit.shを実行してください。

   ```shell
   cd CurationmapStarter
   ./init.sh
   ```

3. Webサーバ(webapp)を起動する場合

   ```shell
   ./run-webapp.sh
   ```

   その後Dockerコンテナ内で、

   ```shell
   ./run.sh
   ```

   とすると、Webサーバが立ち上がります。
   ブラウザで、localhostにアクセスすると、閲覧が可能です。

4. factoryを起動する場合

   ```shell
   ./run-factory.sh
   ```

   その後、Dockerコンテナ内で、

   ```shell
   ./run.sh ○○
   ```

   （○○は検索したいクエリ）とすると、キュレーションマップの記事収集とマップ作成が始まります。

   ※CurationmapFactory内のsrc/main/resources/appplication.confのbingkeyを適切なものに書き換える必要があります。

5. 終了
   Dockerコンテナ内で、

   ```shell
   exit
   ```

   とすると、コンテナから出ることができます。

   ```shell
   ./stop.sh
   ```

   で、全コンテナを終了できます。

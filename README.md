# CurationmapStarter
## はじめに
このリポジトリは、[キュレーションマップシステム](https://github.com/JotaroAbe/CurationmapGenerator)の一部です。
## 動作要件
- Docker
- Docker-compose
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
    ```
    git clone git@github.com:JotaroAbe/CurationmapStarter.git
    ```
2. リポジトリ直下でinit.shを実行してください。
   ```
   cd CurationmapStarter
   ./init.sh
   ```
   ※環境によっては管理者権限でなければDockerが起動しない場合があります。
   ```
   sudo ./init.sh
   ```
   
3. Webサーバ(webapp)を起動する場合
   ```
   ./run-webapp.sh
   ```
   その後Dockerコンテナ内で、
   ```
   ./run.sh
   ```
   とすると、Webサーバが立ち上がります。
   ブラウザで、localhostにアクセスすると、閲覧が可能です。
4. factoryを起動する場合
   ```
   ./run-factory.sh
   ```
   その後、Dockerコンテナ内で、
   ```
   ./run.sh
   ```
   とすると、キュレーションマップの記事収集とマップ作成が始まります。
5. 終了\
   Dockerコンテナ内で、
   ```
   exit
   ```
   とすると、コンテナから出ることができます。
   ```
   ./stop.sh
   ```
   で、全コンテナを終了できます。

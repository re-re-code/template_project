# README.md

## 注意点

- pipとaptに依存関係があるPythonライブラリが存在する
  - aptのみでインストールすべきものもあるので注意
- docker-compose.ymlでのvolumeマウントは、Dockerfileによるビルド時には利用できない
  - Dockerfile内でCOPYコマンドの実行が必要
- docker image(ここではubuntu22.04)を何度もビルドする際に、pullしていると、100times/6hoursの制限があるため、可能ならローカルに持っておいたほうが良い?
- VScodeのExtensionであるdevcontaierでビルド→アタッチする際は、
  - devcontainer.json -> docker-compose.yml -> Dockerfileの順で参照される
  - コンテナにアタッチするために、`CMD ["tail", "-f", "/dev/null"]`などで永続化が、"開発時:コーディング時"には必要
- SSHの設定は必要ではない。ただしローカル→サーバー→Dockerという手順を一気にローカル→Dockerとしたいのならば恐らく必要
  - ※extensions:devcontainerはSSHを用いずにアタッチしている
- 各docker設定ファイルで、「絶対or相対パス」でファイル操作している場合、何を基準にファイルが呼ばれているかに注意
- vscodeのsetting.jsonは「ワークスペース設定→ユーザー設定→デフォルト設定」の順で参照される

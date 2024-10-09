# Poetry+PyTorch Sample

このプロジェクトは、PyTorchを使用してMNISTデータセットを扱うサンプルアプリケーション。
以下の手順に従ってプロジェクトのセットアップ、Dockerイメージのビルド、アプリケーションの実行可能。

## 必要なもの

- Docker

## Setup

リポジトリをローカル環境にクローンする。

### DockerBuild

```bash
docker build -t poetry-pytoarch-sample .
```

```bash
docker run --rm poetry-pytoarch-sample .
```
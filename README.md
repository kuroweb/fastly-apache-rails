# fastly-apache-rails

「Fastly + Apache + Rails」環境にて、CDNによるキャッシュについて学習するためのリポジトリ

## Installation

#### 1. リポジトリをクローン

```bash
git clone https://github.com/kuroweb/fastly-apache-rails.git
cd fastly-apache-rails
```

#### 2. node_modulesディレクトリを作成

```bash
mkdir volumes/web/node_modules
mkdir volumes/fastly/node_modules
```

#### 3. Dockerイメージをビルド

```bash
docker compose build
```

#### 4. プロジェクトを起動

```bash
docker compose up -d
```

## TODO

- [x] コンテナ環境を構築する
- [ ] fastly -> Apache -> Rails の経路でRailsアプリケーションに疎通させる
- [ ] 動作検証

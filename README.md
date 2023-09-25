# fastly-apache-rails

「Fastly + Apache + Rails」環境にて、CDNによるキャッシュについて学習するためのリポジトリ

Fastlyは大きく分けて2つのサービスがある。

- VCL: 動的コンテンツの配信用
- C@E: 動的コンテンツの配信用

本リポジトリでは`C@E`を取り扱う。

## Compute@Edgeの概要

```uml
@startuml
participant Client as client

box fastly
participant C@E as c@e
participant Cache as cache
end box

box Rails
participant Origin as origin
end box

client->c@e:リクエスト

activate c@e

c@e->cache:Cacheの要求

activate cache

note over of cache
Cacheがある場合
end note

cache->c@e:Cacheの返却
c@e->client:レスポンス

note over of cache
Cacheが無い場合
end note

cache->origin:リクエスト

activate origin

origin->cache:レスポンス

deactivate origin

note over of cache
Cacheしない場合
end note

cache->c@e:コンテンツを返却
c@e->client:レスポンス

note over of cache
Cacheを作成
end note

cache->c@e:Cacheの返却

deactivate cache

c@e->client:レスポンス

deactivate c@e

@enduml
```

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
- [x] fastly -> Apache -> Rails の経路でRailsアプリケーションに疎通させる
- [ ] 動作検証

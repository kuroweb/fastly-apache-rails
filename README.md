# fastly-apache-rails

「Fastly + Apache + Rails」環境にて、CDNによるキャッシュについて学習するためのリポジトリ

Fastlyは大きく分けて2つのサービスがある。

- VCL: 動的コンテンツの配信用
- C@E: 動的コンテンツの配信用

本リポジトリでは`C@E`を取り扱う。

## Compute@Edgeの概要

```mermaid
sequenceDiagram
  participant client as Client

  box blue Fastly
    participant c@e as C@E
    participant cache as Cache
  end

  box red Origin
    participant rails as Rails
  end

  client->>c@e: リクエスト
  activate c@e
  c@e->>cache: Cacheの要求
  activate cache

  alt Cacheがある場合
    cache-->>c@e: Cacheの返却
    c@e-->>client: レスポンス
  else Cacheがない場合
    cache->>rails: リクエスト
    activate rails
    rails-->>cache: レスポンス
    deactivate rails

    alt Cacheしない場合
      cache-->>c@e: コンテンツを返却
      c@e-->>client: レスポンス
    else Cacheする場合
      cache --> cache: キャッシュを作成
      cache-->>c@e: コンテンツを返却
      deactivate cache
      c@e-->>client: レスポンス
      deactivate c@e
    end
  end
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

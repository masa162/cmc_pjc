# Punk Junk City

マンガプロジェクト「Punk Junk City」の制作管理用ドキュメント

**サイバーパンク×ヒューマンドラマ - ジャンク都市で生きる人々の物語**

## 概要

このリポジトリは、マンガ「Punk Junk City」のエピソード、キャラクター、世界観設定などを管理するためのHugoサイトです。

- **ジャンル**: サイバーパンク、ヒューマンドラマ
- **舞台**: 未来の巨大都市「朝霧市」
- **形式**: 縦スクロール Webtoon

## セットアップ

### 必要要件

- [Hugo Extended 0.146+](https://gohugo.io/installation/)
- Git

### 初回セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/masa162/cmc_pjc.git
cd cmc_pjc

# テーマ（submodule）を取得
git submodule update --init --recursive

# 開発サーバーを起動
make serve
# または
hugo server -D
```

ブラウザで `http://localhost:1313` にアクセス

## 使い方

### 利用可能なコマンド

```bash
make help    # ヘルプ表示
make build   # サイトをビルド
make serve   # 開発サーバーを起動
make clean   # ビルド成果物を削除
```

### 新しいエピソードの作成

```bash
hugo new episodes/episode-XX.md
```

`content/episodes/episode-XX.md` が作成されます。

### 新しいキャラクターの作成

```bash
hugo new characters/character-name.md
```

`content/characters/character-name.md` が作成されます。

## ディレクトリ構造

```
.
├── content/           # コンテンツ（mdファイル）
│   ├── episodes/      # エピソード
│   ├── characters/    # キャラクター
│   └── settings/      # 世界観・設定
├── themes/            # Hugoテーマ
│   └── cmc-hugo-theme/
├── archetypes/        # コンテンツテンプレート
├── hugo.toml          # サイト設定
├── Makefile           # ビルドスクリプト
└── .gitignore
```

## GitHub Pagesへのデプロイ

このリポジトリはGitHub Actionsによる自動デプロイに対応しています。

### 初回設定

1. GitHubリポジトリの **Settings** → **Pages** を開く
2. **Source** を「GitHub Actions」に設定
3. `main` ブランチにpushすると自動的にデプロイされます

### デプロイURL

デプロイ後、以下のURLでアクセスできます：
- https://masa162.github.io/cmc_pjc/

### 手動デプロイ

GitHub Actionsタブから「Deploy to GitHub Pages」ワークフローを手動実行することもできます。

## ライセンス

このプロジェクトのコンテンツは著作権で保護されています。

## リンク

- [CMC Hugo Theme](https://github.com/masa162/cmc-hugo-theme)
- [Hugo Documentation](https://gohugo.io/documentation/)
- [公開サイト](https://masa162.github.io/cmc_pjc/) （GitHub Pages）

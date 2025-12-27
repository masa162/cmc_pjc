.PHONY: help build serve clean deploy

# デフォルトターゲット: ヘルプ表示
help:
	@echo "利用可能なコマンド:"
	@echo "  make build   - サイトをビルド (public/に出力)"
	@echo "  make serve   - 開発サーバーを起動 (ドラフト含む)"
	@echo "  make clean   - ビルド成果物を削除"
	@echo "  make deploy  - ビルド後にGitHubにプッシュ (オプション)"

# サイトをビルド
build:
	@echo "Building Hugo site..."
	hugo --minify

# 開発サーバーを起動 (ドラフト含む)
serve:
	@echo "Starting Hugo development server..."
	hugo server -D

# ビルド成果物を削除
clean:
	@echo "Cleaning build artifacts..."
	rm -rf public/ resources/

# ビルド後にGitHubにプッシュ (オプション)
deploy: clean build
	@echo "Deploying to GitHub..."
	git add .
	git commit -m "Update content"
	git push origin main

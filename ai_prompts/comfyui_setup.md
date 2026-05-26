# ComfyUI 環境セットアップ & 運用メモ

## 環境

| 項目 | 内容 |
|---|---|
| インストール先 | `D:\github\ComfyUI` |
| GPU | NVIDIA GeForce RTX 3060 (12GB VRAM) |
| Python | 3.11.9 (venv) |
| PyTorch | 2.4.1+cu121 |
| ComfyUI | v0.21.1 |

## 起動手順

PowerShellで実行：

```
D:\github\ComfyUI\venv\Scripts\python.exe D:\github\ComfyUI\main.py --port 8188
```

ブラウザで開く → http://localhost:8188

生成画像の保存先：`D:\github\ComfyUI\output\`

## モデル構成（Flux1-schnell）

| 種別 | ファイル | 場所 |
|---|---|---|
| UNet | `flux1-schnell.safetensors` | `models/unet/` |
| CLIP | `clip_l.safetensors` | `models/clip/` |
| T5 | `t5xxl_fp8_e4m3fn.safetensors` | `models/clip/` |
| VAE | `diffusion_pytorch_model.safetensors` | `models/vae/` |

ワークフロー：`D:\github\ComfyUI\user\default\workflows\flux1-schnell.json`

## KSampler 推奨設定

| パラメータ | 値 |
|---|---|
| steps | 20 |
| cfg | 7.0 |
| sampler | euler |
| scheduler | simple |
| seed | 任意（fixedで固定） |

## トラブルシューティング

### PyTorch CUDA エラー時の再インストール（2026-05-19 実施）

cu128はDLL依存問題が出たのでcu121を使う。

```
D:\github\ComfyUI\venv\Scripts\pip.exe uninstall torch torchvision torchaudio -y
D:\github\ComfyUI\venv\Scripts\pip.exe install torch==2.4.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
```

### ComfyUI本体の更新

```
cd D:\github\ComfyUI
git checkout master
git pull origin master
D:\github\ComfyUI\venv\Scripts\python.exe -m pip install -r requirements.txt --upgrade
```

---

## アサギりシティ 背景プロンプト集

### ネクサス（中層）路地裏・雨の夜

**Positive:**
```
cyberpunk alley, neon signs, rain, night, dense buildings, holographic advertisements, manga background, line art, black and white, ink drawing, clean linework, high contrast, no people, cinematic perspective, detailed architecture
```

**Negative:**
```
people, characters, color, shading, blur, low quality
```

### ネクサス・街頭（広角）

**Positive:**
```
cyberpunk city street, neon lights, rain puddles reflecting neon, crowded market, manga style background, black and white, line art, detailed buildings, overhead cables, signs in japanese, wide angle, no characters
```

### 澱区（下層）バー内装

**Positive:**
```
dark cyberpunk bar interior, dim neon lighting, gritty atmosphere, manga background, black and white ink, line art, bar counter, bottles, dim lights, underground, detailed interior
```

---

## クリスタへの持ち込み手順

1. `D:\github\ComfyUI\output\` から画像を取得
2. クリスタで「編集」→「輝度を透明度に変換」で線画抽出
3. キャラクターレイヤーと合成

詳細：`ai_prompts/tech_lineart_workflow.md` 参照

# description: スナップショット叙情コミック — イメージ断片から1ページ完結コミックを生成

## コンセプト

どこにも属さない、1ページ完結の叙情コミック。
IPなし・世界観なし・セリフなし。断片的なイメージの積み重ねだけで成立する。
tokyo86.com直結。スキマ時間のクリエイティブ。

---

## クリエイティブ思想

**「正しくない構図」が感情を作る。**

- 正しい構図 → 美しいが、感情がない
- 意図的に崩した構図 → アンニュイ、気怠さ、やるせなさが生まれる

岩井俊二的文法：
- 被写体がフレームの端で切れる
- 前景のボケで「越しに撮る」
- 人物がフレームから逃げている
- 地平線が傾く、水平を信じない
- 非対称な空白（人物を端に寄せ、反対側を空にする）
- 「ずっとそこにいた」感じ。ドラマのない持続

**セリフは不要。テキストは0か1行。**

---

## カット構成（基本）

| カット | サイズ | 役割 |
|---|---|---|
| 1〜3 | 小 | 断片。物・自然・細部。人物なし可 |
| 4 | 中 | 人物登場。後ろ姿か部分のみ |
| 5 | 大 | 沈黙の全景。人物は小さく、端に寄る |

**Canvaレイアウト：** 上段3小・中段1中・下段1大（縦長1ページ）

---

## 生成手順

1. ユーザーがモチーフ（場所・人物・季節・感情）を提供
2. 5カット構成を設計（何を切り取るか）
3. 英語プロンプトを生成（共通部分 + 各カット）
4. ver.1（正しい構図）を先に出す
5. フィードバックに応じてver.2（崩し構図）に切り替え
6. `content/snapshot/snapshot[NNN].md` に保存

---

## 画像生成プロンプト

### ver.1 共通部分（整った構図）
```
Japanese manga style. Elegant, cinematic black and white line art.
Fashion editorial aesthetic. Lyrical, melancholic mood.
Strong use of white space for light and glare effects.
No speech bubbles. No text. Single female character.
Magazine spread aesthetic. Minimal detail, maximum atmosphere.
```

### ver.2 共通部分（崩した構図・アンニュイ）
```
Japanese manga style. Black and white line art with film grain texture.
Slightly imperfect, off-balance compositions. Iwai Shunji aesthetic.
Subjects partially cropped by frame edges. Unfocused foreground elements.
Melancholic, languid mood. Physical sensation of heat and humidity implied.
No speech bubbles. No text. Minimal detail.
```

### ver.2 構図キーワード集（カットごとに組み合わせる）
```
- slightly off-center, drifting toward one side
- partially cut off by the frame edge
- shot through out-of-focus foreground element
- slightly tilted frame, not level
- the figure is pushed to one side — the other half is empty
- caught mid-motion, like a snapshot taken without looking
- watching someone who doesn't know they are being watched
- she has been standing there for a while (long duration implied)
- posture is slack, not dramatic. Shoulders slightly dropped
- overexposed in patches, unevenly
```

---

## テキスト方針

- 基本：なし（純粋イメージ）
- 使う場合：最終カット（大）に1行のみ
- 形式：白文字 or 画面内テキスト。句点なし
- トーン：説明しない。余白を残す。断言しない

---

## Canvaテキスト合成メモ

| 要素 | 設定 |
|---|---|
| 全体サイズ | 縦長1ページ（A4 or スマホ縦） |
| 上段 | 小カット×3横並び |
| 中段 | 中カット×1（ページ幅） |
| 下段 | 大カット×1（ページ幅） |
| カット間余白 | 細い白線 |
| テキスト（使う場合） | 大カット内・白文字・中央下 |

---

## 運用知見（2026-05-13確立）

**このフォーマットが機能する条件：**
- キャラクター1人・使い捨て → 一貫性問題なし
- セリフなし → AIが画面解釈しやすい
- 光・グレア・逆光・白飛び → gpt-image-1が得意な領域
- 各カット独立生成 → 毎回新規生成でよい

**ver.1 → ver.2の切り替えタイミング：**
- ver.1で構図・内容が確認できたら、ver.2で感情を乗せる
- 最初からver.2を試してもよい（セレンディピティが引ける）

**セレンディピティについて：**
- AIが意図外の崩し方をすることがある → 歓迎してよい
- プロンプトで「正しくない」を指定すると、AIの解釈のズレ自体がアンニュイになる

**gpt-image-1 vs Gemini：**
- gpt-image-1：白飛び・非対称空白・フレーム逃げに強い
- Gemini：前景ボケ・草越しカットに強い。線が太め
- 用途で使い分け可

**縦積みフォーマットについて（snapshot002で確認）：**
- 5カットを縦に積むとSNS縦スクロール形式になる
- 横並び3＋大1の横レイアウト版と、縦積み版の2パターンが使える
- 縦積みは読む速度が遅くなり、間が生まれる → 叙情に向いている

**bridge素材としての用途（snapshot002で発見）：**
- セリフなし大気カットは、セリフ/ナレーションを乗せた物語の「つなぎコマ」として機能する
- 場面転換・時間経過・感情の余白として別作品に差し込める
- 独立作品としても、素材としても成立する二重の使い方がある

**公開：**
- IPなし・タイトルなし・1枚完結でtokyo86.comに直接上げる
- PJCブランドを付けない

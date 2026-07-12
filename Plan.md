# ETS2 ナビ音声MOD作成 計画書 (Plan.md)

今回のタスクでは、ETS2のナビ音声MODを作成するための準備、アセット生成、パッケージングの仕組みを作ります。

## タスクの目的
- ETS2（1.37以降）に対応したナビ音声MODを作成するための開発環境をローカルに構築する。
- 必要な音声イベントのリストを整理し、音声アセットの用意・生成を支援する。
- MOD定義ファイル（`.sii` や `manifest.sii`）を作成する。
- MODパッケージング（無圧縮scs）を自動で行うスクリプトを作成し、テストを容易にする。

## 進行手順

### Phase 1: 準備とユーザー確認
1. [x] 要件定義書（`for_agent/requirements.md`）の作成
2. [x] 本計画書（`Plan.md`）の作成
3. [x] ユーザーへの基本方針の確認
   - 誰の音声（キャラクター、ご自身の声、その他）を使うか？（宮舞モカの声、ユーザー自身が用意する）
   - VOICEPEAK等の外部ツールで出力した音声を `assets/` に配置する方針に決定。
   - アクティブワークスペースを `C:\Users\kohei\.gemini\antigravity\scratch\ets2_voice_mod` に設定。

### Phase 2: フォルダ構築とスクリプト作成
1. [x] `ets2_voice_mod` 内に必要なフォルダ（`assets/`, `mod_root/` 等）を作成する。
2. [x] MODパッケージング用スクリプト（バッチファイル）の作成。
   - `mod_root/` の内容を無圧縮で scs アーカイブ（`.scs`）にするバッチファイルの作成。

### Phase 3: FMOD Studioとテンプレートの導入サポート
1. [x] SCS公式のFMODテンプレートの配置・説明（`FMOD_INSTRUCTIONS.md`の作成）。
2. [x] FMOD Studioでの設定手順のドキュメント作成（`FMOD_INSTRUCTIONS.md`の作成）。

### Phase 4: 定義ファイルの作成
1. [x] `manifest.sii`（MODマニフェスト）の作成。
2. [x] `sound/navigation/<voice_name>.sii` の作成（`mym_voice.sii`のモック作成）。

### Phase 5: パッケージングと動作確認
1. [x] 自動パッケージングの実行。
2. [x] ETS2の `mod` フォルダへの配置方法の案内とゲーム内認識確認（リストへの表示成功）。

### Phase 6: 不足イベントの追加と最終調整
1. [x] 不足している3つのボイス（`go_straight`, `prepare_exit_left / right`）の追加インポート用CSVの作成とアセット追加。
2. [x] `speed_limit` イベントを `speed_signal` に修正する手順をドキュメント化および反映。
3. [x] 複合イベント（`compound_` / `and_then_` シリーズ）をタイムライン上で合成する手順を案内および仕様化。
4. [x] 複合音声の配置・FMODでの再ビルド後、MODパッケージングを行い最終確認。

### Phase 7: セリフの改善と複合指示の最適化
1. [x] 公式のナビ音声セリフと重複の原因を分析し、ドキュメント（`voice_lines_sample.md`）を作成。
2. [ ] 改善用の新規ボイス（`compound_xxx`シリーズ）のVOICEPEAK出力と差し替え。
3. [ ] FMOD Studioでの再ビルドと、GitHub自動リリースによる公開。
4. [x] MODマネージャー用アイコンの登録（manifest.sii への定義追加）

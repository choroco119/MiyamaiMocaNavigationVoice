# AI変更履歴 (AICHANGELOG.md)

## 2026/07/09

### 概要
ETS2のナビ音声MOD作成プロジェクトの立ち上げ。要件定義書と計画書の作成。

### 変更点
- **[NEW]** `for_agent/requirements.md` : ETS2のナビ音声MOD要件およびFMOD Studioを用いた制作ワークフローの定義。
- **[NEW]** `Plan.md` : MOD作成までの作業ステップと方針の定義。
- **[NEW]** `AICHANGELOG.md` : 変更履歴の管理ファイルを作成。

## 2026/07/09 (環境構築と自動化)

### 概要
環境構築のフォルダ作成、FMOD導入解説手順書の作成、自動化スクリプトの用意、SII定義ファイルのモック作成を完了。

### 変更点
- **[NEW]** `make_mod.bat` : Windows標準の `tar.exe` を使用して、無圧縮（Store）形式のMODアーカイブ（`.zip`）を作成する自動化バッチスクリプトを作成。
- **[NEW]** `FMOD_INSTRUCTIONS.md` : FMOD Studioのインストール手順および、SCSテンプレートを使用したナビ音声のルーティング、バンクビルド手順のドキュメントを作成。
- **[NEW]** `mod_root/manifest.sii` : MODの表示名や制作者、カテゴリを定義するマニフェストファイルを作成。
- **[NEW]** `mod_root/mod_description.txt` : MODマネージャー用の説明文テキストファイルを作成。
- **[NEW]** `mod_root/sound/navigation/mym_voice.sii` : ボイスナビゲーション定義SIIファイルを作成。
- **[MODIFY]** `Plan.md` : 基本方針確認、フォルダ構築、スクリプト作成、定義ファイル作成のタスクの完了マークを付与。
- **[DELETE]** `make_mod.py` / `make_mod.ps1` : 検証時に作成。環境非依存で最も安定して動作するバッチファイル（`make_mod.bat`）に一本化したため削除。

## 2026/07/10 (原稿の反映とインポート用CSV作成)

### 概要
ユーザーが作成した「宮舞モカ（＋ワトソンくん）」用のナビ音声原稿を仕様書に同期し、VOICEPEAKへのインポート用CSVおよび出力ファイルの対応表を作成。

### 変更点
- **[MODIFY]** `for_agent/requirements.md` : 音声イベント一覧を、ユーザー提供のセリフ原稿（`ETS2 ナビ音声MOD原稿.md`）の内容に更新。
- **[NEW]** `voicepeak_import.csv` : VOICEPEAKにセリフを一括読み込みするためのCSVファイルを作成（ナレーター名「宮舞モカ」指定）。
- **[NEW]** `voicepeak_file_mapping.txt` : VOICEPEAKから一括出力された連番WAVファイルと、ETS2で必要なイベントファイル名の対応表を作成。

## 2026/07/11 (セリフ原稿の微修正反映)

### 概要
セリフ原稿の吃音表現や誤字の修正に伴い、仕様書、VOICEPEAK用CSV、および対応表を更新。

### 変更点
- **[MODIFY]** `for_agent/requirements.md` : 最新のセリフ原稿内容に更新。
- **[MODIFY]** `voicepeak_import.csv` : 最新のセリフ原稿内容に更新。
- **[MODIFY]** `voicepeak_file_mapping.txt` : 最新のセリフ原稿内容に更新。
- **[MODIFY]** `assets/` : VOICEPEAKから出力された連番（00〜22）のWAVファイルをETS2イベント名（`start.wav` 等）に一括リネームし、不要なテキストファイルをクリーンアップ。
- **[MODIFY]** `make_mod.bat` : `tar` コマンドを `mod_root` 内でワイルドカード（`*`）を使用して実行するように変更し、パス名から `./` 接頭辞を排除。これによりWindowsエクスプローラーでZIP内が空に見える表示バグを修正。
- **[MODIFY]** `mod_root/sound/navigation/` : `mym_voice/` サブフォルダを廃止し、FMODバンクおよびGUIDファイルを `sound/navigation/` 直下の元の配置に戻した。
- **[MODIFY]** `mod_root/sound/navigation/mym_voice.sii` : 最新のFMOD仕様に基づき、エラーや警告の原因となる `pack_dir` や `sound_bank` をすべて削除し、 `pack_name` のみの記述に修正。
- **[MODIFY]** `mod_root/manifest.sii` : MODマネージャーでの表示名を `Maimai Moka...` から、正しい公式表記の `Miyamai Moca...` に（苗字・名前ともに）修正。
- **[MODIFY]** `mod_root/sound/navigation/mym_voice/` : 二重拡張子（`.guids.txt`）になっていたファイルを、正しいゲーム仕様である `mym_voice.bank.guids` にリネーム。
- **[MODIFY]** `make_mod.bat` : 作成するZIPファイルの名前を、MODの正式名称に合わせた `Miyamai Moca Navigation Voice.zip` に変更。
- **[MODIFY]** `for_agent/requirements.md` : 不足していた3つの音声イベント（`go_straight`, `prepare_exit_left / right`）の追加、および `speed_limit` から `speed_signal` への修正を仕様書に反映。
- **[MODIFY]** `FMOD_INSTRUCTIONS.md` : 複合イベント（`compound_` / `and_then_`）のFMOD上での作成方法、手動GUIDエクスポート方法、二重拡張子の警告を追記。
- **[MODIFY]** `Plan.md` : Phase 5を完了とし、不足イベント追加と最終調整の「Phase 6」を追記。
- **[NEW]** `voicepeak_import_addition.csv` : 不足セリフ（3行）のVOICEPEAKインポート用追加CSVを作成。
- **[NEW]** `voicepeak_file_mapping_addition.txt` : 追加音声用ファイル対応表を作成。
- **[MODIFY]** `for_agent/requirements.md` : 14個の複合指示イベント（FMODタイムライン合成）の定義を仕様書に追加。
- **[MODIFY]** `make_mod.bat` : 出力されるMODの拡張子を `.zip` から正式な `.scs`（無圧縮ZIP）に変更。
- **[MODIFY]** `for_agent/requirements.md` / `Plan.md` : 拡張子の変更（.zipから.scs）に関する記述をそれぞれ更新。
- **[NEW]** `.gitignore` : ビルド成果物（.scs, .zip）やOS一時ファイルを管理外に設定。
- **[NEW]** `.github/workflows/release.yml` : GitHub Actionsによる、バージョンタグ検知時の無圧縮 `.scs` MODの自動ビルド＆自動リリースデプロイフローを構築。
- **[MODIFY]** Gitリポジトリを初期化し、リモートを登録、初回コミットおよびタグ `v1.0.0` のプッシュを実施。コミット作成者のプライバシー保護（user.name / email）を固定。
- **[NEW]** `README.md` : MODの概要、特徴、詳細な導入手順、開発者向け情報、ライセンス表記を含んだ説明ドキュメントを作成し、GitHubにプッシュ。
- **[NEW]** `voice_lines_sample.md` : バニラの日本語音声セリフ設計を調査し、フレーズ重複を回避するための宮舞モカ用のセリフ対照表および改善案を作成。
- **[MODIFY]** `Plan.md` / `for_agent/requirements.md` : セリフ改善と複合指示最適化（Phase 7）に関する記述をそれぞれ追加。
- **[MODIFY]** GitHubリポジトリ名が `MiyamaiMocaNavigationVoice` へ変更されたことに伴い、ローカルのGitリモートURLを追従設定。`README.md` および各種報告用ドキュメント内の古いリポジトリURLをすべて最新に更新・プッシュ。
- **[MODIFY]** `mod_root/manifest.sii` : MODマネージャー表示用のアイコン画像 `mod_icon.jpg` の参照定義を追加。
- **[MODIFY]** `Plan.md` / `for_agent/requirements.md` : アイコン画像の仕様と指定手順を追記。
- **[NEW]** `mod_root/mod_icon.jpg` : AI画像生成（generate_image）機能を使用して「トラックの助手席に座る宮舞モカ」風のアイコンを生成し、サイズ（276x162）にリサイズして配置。
- **[MODIFY]** 新しいタグ `v1.0.1` を発行・プッシュし、アイコン付きのMODパッケージ自動リリースをキック。

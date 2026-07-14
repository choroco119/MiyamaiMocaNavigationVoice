# VOICEPEAK出力連番WAVファイルを自動的に宮舞モカ用WAVファイル名にリネームするスクリプト (3パターン対応版)

$mappingFile = Join-Path $PSScriptRoot "..\voicepeak_file_mapping_3patterns.txt"
$assetsDir = Join-Path $PSScriptRoot "..\assets"

if (-not (Test-Path $mappingFile)) {
    Write-Error "エラー: マッピングファイルが見つかりません: $mappingFile"
    exit 1
}

# マッピング辞書の構築
$mapping = @{}
Get-Content $mappingFile | ForEach-Object {
    if ($_ -match '^(\d+):(.+)$') {
        $num = [int]$Matches[1]
        $name = $Matches[2].Trim()
        $mapping[$num] = $name
    }
}

Write-Host "マッピング定義を読み込みました (計 $($mapping.Count) 件)"

# assetsディレクトリのWAVファイルを取得
if (-not (Test-Path $assetsDir)) {
    Write-Error "エラー: assetsフォルダが見つかりません: $assetsDir"
    exit 1
}

$files = Get-ChildItem -Path $assetsDir -Filter "*.wav"
Write-Host "assetsフォルダ内に $($files.Count) 個のWAVファイルが見つかりました。"

$renameCount = 0

foreach ($file in $files) {
    # ファイル名から先頭の数字を抽出 (例: "001-xxxx.wav" や "001.wav" から "1" を抽出)
    if ($file.BaseName -match '^0*(\d+)') {
        $num = [int]$Matches[1]
        if ($mapping.ContainsKey($num)) {
            $newName = $mapping[$num] + ".wav"
            $destPath = Join-Path $assetsDir $newName
            
            # リネーム実行 (競合回避のため-Force)
            Write-Host "リネーム中: $($file.Name) -> $newName"
            Move-Item -Path $file.FullName -Destination $destPath -Force
            $renameCount++
        }
    }
}

Write-Host "リネーム処理が完了しました！ (合計 $renameCount 件)"

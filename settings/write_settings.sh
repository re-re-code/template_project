#!/bin/bash
# settings.json の保存先ディレクトリ
SETTINGS_DIR="/opt/amazon/sagemaker/sagemaker-code-editor-server-data/data/User"
SETTINGS_FILE="$SETTINGS_DIR/settings.json"

# settings.json ディレクトリを作成（存在しない場合）
mkdir -p "$SETTINGS_DIR"

# settings.json の内容を設定
cat > "$SETTINGS_FILE" <<EOL
{
    // ======== エディタの全般設定 ========
    "editor.formatOnSave": true, // ファイル保存時に自動フォーマットを実行
}

EOL

echo "settings.json has been updated at $SETTINGS_FILE"
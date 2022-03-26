#!/usr/bin/bash

echo 'OneDriveが存在するか確認します。'
if [ ! -d $HOME/OneDrive ]; then
    echo 'OneDriveを確認できませんでした。'
    exit 1
fi
echo 'OneDriveを確認できました。'
    
echo '圧縮タイプを取得します。'
type='zip'
if [ $# -ne 1 ]; then
    echo '圧縮タイプを設定しなかったためzip形式で圧縮されます。'
else
    case $1 in
        'zip')
            type='zip'
            ;;
        *)
            echo '圧縮タイプが不明です。対応している圧縮タイプは以下になります。'
            echo 'zip, '
            exit 1
            ;;
    esac
fi
echo "圧縮タイプを$typeに設定しました。"

path=$(basename $(pwd))
suffix=$(date +%Y-%m-%d-%H%M%S)
all=${suffix}${path}.${type}
if [ -z "$path" ]; then
    echo 'ファイル名が不明です。'
    exit 1
else if [ -e $all ]; then
    echo 'ファイルが重複しています。再度お試しください。'
    exit 1
fi
echo "ファイル名を$allに設定しました。"
case $type in
    'zip')
        zip -r $all ./ -x "*backup.fish*"
        ;;
    *)
        echo '圧縮タイプが不明です。'
        exit 1
        ;;
esac
echo 'ファイルを移動します。'
mv -v $all $HOME/OneDrive
if [ -e $HOME/OneDrive/$all ]; then
    echo 'バックアップの生成及びアップロードが正常に完了しました。'
else
    echo 'バックアップの移動段階でエラーが発生しました。'
fi
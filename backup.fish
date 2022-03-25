#!/usr/bin/env fish

function __compress
    set suffix (date +%Y-%m-%d-%H%M%S)
    set file $argv[2]
    set all {$suffix}{$file}.{$argv[1]}
    echo $all
    if test -z {$file}
        echo 'function:compress ファイル名が不明です。'
        exit
    else if test -e {$HOME/OneDrive/$all}
        echo 'function:compress ファイルが重複しています。再度お試しください。'
        exit
    end
    switch $argv[1]
    case 'zip'
        zip -r $all ./ -x "*backup.fish*"
    case '*'
        echo 'function:compress 引数名が不明です。'
        exit
    end

    echo 'ファイルを移動します。'
    mv -v $all $HOME/OneDrive
    if test -e {$HOME/OneDrive/$all}
        echo 'function:compress バックアップの生成及びアップロードが正常に完了しました。'
    else
        echo 'function:compress バックアップの移動段階でエラーが発生しました。'
    end
end

echo 'OneDriveが存在するか確認します。'
if test -e {$HOME/OneDrive}
    echo 'OneDriveを確認できました。'
else
    echo 'OneDriveが確認できませんでした。'
    exit
end

echo '圧縮タイプを取得します。'
set type 'zip'
if test -z {$argv[1]}
    echo '圧縮タイプを設定しなかったためzip形式で圧縮されます。'
else if test 'zip' = {$argv[1]}
    echo '圧縮タイプをzipに設定しました。'
    set type 'zip'
else
    echo '圧縮タイプが不明です。対応している圧縮タイプは以下になります。'
    echo 'zip, '
    exit
end

set path (basename (pwd))
__compress $type $path

# OneDrive-BackupScript
無制限のOneDriveにバックアップを作成するスクリプト(bash / fish)  

![](https://github.com/xrozl/OneDrive-BackupScript/blob/main/sample.jpeg?raw=true)

## プログラム概要  
当シェルスクリプトを実行すると`~/OneDrive/`ディレクトリにシェルスクリプトを実行したディレクトリのファイルを全て圧縮した`zip`形式のファイルがコピーされます。  

## 注意  
OneDriveとの連携ミス等その他問題が万が一発生した場合責任は一切取りません。  
あくまでも使用は自己責任でよろしくお願いします。  
作成者は主にiTerm / Fish Shellユーザーの為bash側のスクリプトのテストはしていません。  
万が一エラーなど使用ができない場合はissueを立てていただけると助かります。  

## 使い方 (Mac OSX)  

シェルスクリプト(`backup.fish`)に対して`fish backup.fish [type]`を実行することで自動でOneDriveまでコピーをしてくれる。  
初期値では`zip`ファイルとして圧縮されるが、  
第一引数に圧縮タイプを指定することで任意の圧縮タイプで作成することができる。(現段階では`zip`のみ対応)  

**fish**  
```bash  
curl https://raw.githubusercontent.com/xrozl/OneDrive-BackupScript/main/backup.fish && fish backup.fish  
```  
**bash**  
```bash  
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xrozl/OneDrive-BackupScript/main/backup.sh  
```  

## 動作確認環境  
- MacBook Pro 14'inch (M1 Pro Processor / **Fish** Shell)  
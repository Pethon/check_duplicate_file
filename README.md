# check_duplicate_file
実行コマンド  
-dir ディレクトリ名  
-num ファイルの数  
-type 拡張子(複数の場合は，','で分ける)
```
.\check_duplicate_file.ps1 -dir C:\kadai\ -num 2 -type .pdf,.doc,.docx
```

実行できない場合は
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
Y を入力してEnterを押す．

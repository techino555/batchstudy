@echo off
rem 作成 石川

rem 処理開始を宣言
echo 処理を開始

rem "C:\Users\hide\Desktop\HTML"フォルダを開く
call explorer C:\Users\hide\Desktop\HTML

rem 処理競合を防止するため1秒間待つ
timeout /t 1

rem "C:\Users\hide\Desktop\Linux"フォルダを開く
call explorer C:\Users\hide\Desktop\Linux

rem バッチの終了
exit /b
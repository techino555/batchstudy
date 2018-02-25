---

<img src="/images/introduction.gif" width=90%>

---

### 閲覧上の注意
- 本資料はPCからの閲覧推奨です。
- スマートフォンからの閲覧が可能です。
- 下にスライドして進めることがあります。
- スマホではスワイプでページ移動します。

---

### 目次
1. バッチ（バッチファイル）とは
2. バッチが活躍する場面
3. バッチの作成と実行手順
4. remとechoは書こう
5. 変数の紹介
6. バッチは役割ごとに分けて作る
7. 参照資料、ツールの紹介

---

### 1.　バッチ（バッチファイル）とは  
- Wikipedia バッチファイル(抜粋)より
<p><font size="5">バッチファイル（Batch File）とは、MS-DOS、OS/2、Windowsでのコマンドプロンプト(シェル)に行わせたい命令列をテキストファイルに記述したもの。バッチファイルを実行すると、シェルプログラム(一般に COMMAND.COMやcmd.exe)がそのファイルを読み、その中のコマンドを（通常）一行ずつ実行する。</p>
<p><font size="5">バッチファイルはUNIX系オペレーティングシステムのシェルスクリプトに相当。</p>
<p><font size="5">DOSのバッチファイルの拡張子は.BATである。</p>
 
---

### 2.　バッチが活躍する場面
#### 大きくは下記の２つが占める
- ディスクの容量、ネットワークの情報などサーバや端末に関する情報を一度にまとめて取得するとき。
- タスクスケジューラーを使用の上、決まった時間にサーバで処理をさせたいとき。<br/>
<br/>
**タスクスケジューラーでよく実装されるのは定期再起動とバックアップ。**

---

### 3.　バッチの作成と実行手順
1. txtファイルを作成
2. 処理内容を記載
3. txtファイルの拡張子を.batに変更する
4. 実行する　<img src="/images/bat.JPG"></br>
</br>
作成例は下記@fa[arrow-circle-down fa-lg]</br>
右は次項の内容@fa[arrow-circle-right fa-lg]

+++

下記で特定のフォルダを一度に２つ開くバッチを作る。txtファイルを作成後、ファイル内に処理を記載していく。</br>

```
@echo off
rem 上は後述

call explorer C:\Users\hide\Desktop\HTML
timeout /t 1
call explorer C:\Users\hide\Desktop\Linux
exit /b
```

作成後拡張子をbatに変更し、ダブルクリックするとフォルダが２つ開くことを確認できる。</br>
</br>
次に進む@fa[arrow-circle-right fa-lg]

---

### 4.　remとechoは書こう
- rem： コマンド出力に反映されないのでコメントを記載するときに使用。</br>
- echo： コマンド出力に反映されるコメント。コマンドを投入した人に処理内容を表示する際に使用。</br>
</br>
下に進む@fa[arrow-circle-down fa-lg]</br>
右は次項の内容@fa[arrow-circle-right fa-lg]

+++

**@echo offについて**</br>
これを冒頭に記載しないとバッチの処理がすべてコマンドプロンプトに出力されてしまうため記載することが基本。</br>
</br>
下に進む@fa[arrow-circle-down fa-lg]

+++

remとechoを付与した形
```
test2.bat
```
```
@echo off
rem 作成 石川


rem 処理開始を宣言
echo "処理を開始"


rem "C:\Users\hide\Desktop\HTML"フォルダを開く
call explorer C:\Users\hide\Desktop\HTML


rem 処理競合を防止するため1秒間待つ
timeout /t 1


rem "C:\Users\hide\Desktop\Linux"フォルダを開く
call explorer C:\Users\hide\Desktop\Linux


rem バッチの終了
exit /b
```
処理内容がわかるようになる。    @fa[arrow-circle-right fa-lg]

---

### 5.　変数の紹介
バッチには変数を設定することができる。</br>
例：今日の日付を出力する変数DATE  
```
> echo %DATE%
2018/02/22  
```
変数を%と%を囲うことで定義した値を取得できる。</br>  
下に進む@fa[arrow-circle-down fa-lg]</br>
右は次項の内容@fa[arrow-circle-right fa-lg]

+++

また自分で変数を設定することもできる。</br>  
設定例:  
```
set year=%date:~0,4%    
set month=%date:~5,2%    
set day=%date:~8,2%  
set date2=%year%%month%%day%    
```
</br>
@fa[arrow-circle-down fa-lg]

+++

役割の紹介  

```
set year=%date:~0,4%  
```
→date変数の出力結果の1文字目から5文字までの  
4文字分の値を取得。結果は2018。  
文字のカウントは0から始める。  
```
set month=%date:~5,2%  
```
→date変数のの出力結果の6文字目から7文字までの  
2文字分の値を取得。結果は02。  
</br>
@fa[arrow-circle-down fa-lg]

+++

```
set day=%date:~8,2%  
```
→date変数の出力結果の1文字目から5文字までの  
4文字分の値を取得。結果は22日なら22。  
```
set date2=%year%%month%%day%  
```
→それぞれ設定した変数を%で囲った形で続けて  
定義できる。この場合の結果は20180222。</br>
</br>
@fa[arrow-circle-down fa-lg]

+++

下記はdirコマンドの結果を実施日付を付与したログファイルに出力するもの。
```
sample.bat
```
```
@echo off 
rem 現在のディレクトリ情報を取得する。
rem 今日の日付をログファイルに付加する。
rem 作成は石川。

set year=%date:~0,4%    
set month=%date:~5,2%    
set day=%date:~8,2%  
set date2=%year%%month%%day%    

dir > log_%date2%

exit /b 
```
</br>
@fa[arrow-circle-right fa-lg]

---

### 6.　バッチは役割ごとに分けて作る
一般的に変数設定、ログ出力設定と実処理を記載した</br> 
バッチを実行するだけのバッチファイルと実行したい</br> 
処理を記載したバッチは分けます。</br> 
</br>
下に進む@fa[arrow-circle-down fa-lg]</br>
右は次項の内容@fa[arrow-circle-right fa-lg]

+++

例えば前述のtest2.batを実行し</br> 
ログを出力させるため下記のような</br> 
バッチを別に作り実行するほうがよい。    @fa[arrow-circle-down fa-lg]
```
@echo off
rem 現在のディレクトリ情報を取得する
rem 今日の日付をログファイルに付加する。
rem 作成は石川。

setlocal 
set year=%date:~0,4%
set month=%date:~5,2%
set day=%date:~8,2%
set date2=%year%%month%%day%

echo "処理開始"

call test2.bat >> log_%date2%.txt

endlocal
exit /b
```

+++
このようにしないとtest2.batの実行結果をログ出力</br> 
させる場合はすべての行に「 > log.txt 」などのログ</br> 
出力用の記載をしないといけなくなるためである。</br> 
```
ifconfig >> log.txt
tasklist >> log.txt  のようにログ出力の記載を毎行書くようになる
```
</br>
@fa[arrow-circle-right fa-lg]

---

### 7.　参照資料、ツールの紹介１
- GitPitch</br> 
https://gitpitch.com/</br> 
markdown記法でのプレゼンテーションを可能とするGitHubが提供しているサービス。

---

### 参照資料、ツールの紹介２
- ScreenToGif</br> 
http://www.screentogif.com/</br> 
デスクトップ画面を録画し、ちょっとした画像編集、テキストやイメージを追加してGIFアニメとして保存できるキャプチャソフト。Windows用。

---

### 参照資料、ツールの紹介３
- フォント（@fa[arrow-circle-down fa-lg]など）</br> 
https://fontawesome.com/</br> 
GitPitchで使えるアイコン集。有料のアイコンもある。gitpitchで使えるのは無料のアイコンのみのため今回は無料のものを使用した。

---

**ありがとうございましたm(＿)m**

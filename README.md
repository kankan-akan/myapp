# ポートフォリオ紹介
[https://par-match.com](https://par-match.com)

 __ParMatch__ は、ゴルフ練習場検索・ゴルフレッスン予約ができるアプリケーションです。
 
ゴルフ練習場検索は、数あるゴルフ場の中からすぐに行きたい練習場を見つけることができます。
 
レッスン予約は、これからゴルフを始めたい方・ある程度上手くなったがスコアをもうひと伸びさせたい方等に向けたレッスンを練習場が掲載・管理し、ユーザーがそれらを予約することができます。

**ユーザー側ホーム画面**
<img width="1440" alt="スクリーンショット 2022-09-02 23 59 58" src="https://user-images.githubusercontent.com/86819225/188180777-44751016-ead1-4aa4-87ae-c0cff94b4a80.png">

**練習場管理者側ホーム画面**
<img width="1440" alt="スクリーンショット 2022-09-03 0 23 45" src="https://user-images.githubusercontent.com/86819225/188182289-5fb7b6fe-d9c3-49a9-9636-aca8f738501e.png">

## 制作背景
自分自身の趣味であるゴルフをする中で、こういったサービスがあれば良いなと思うものを形にしました。

昨今のコロナ事情もあり、これからゴルフを始める方や、もっとゴルフが上手くなりたいと思う方が増えているのではないかと考えました。

これからゴルフを始める方であれば、 **「いきなり練習場に行っても打ち方がわからない」「そもそも何から始めたら良いのか」「ゴルフをやってみたいが、周りに教えてくれる人がいない」**<br>
さらに上達したい方であれば、 **「自己流でやってきたのでプロのレッスンを受けてみたいが、他にレッスンを受けている人のレベルが気になる」「練習場のホームページを探して申し込むのが面倒だ」「どこの練習場のレッスンが良いのか」**
などの不安が出てくると思います。

これらのハードルを低くすることで、気軽にゴルフを始める方やゴルフレッスンを受ける方を増やすことができると考えました。<br>
アプリでは、練習場・レッスンの比較を容易にし、練習場の様子や雰囲気などを「みんなの投稿」から知ることができます。

これにより、さらに競技人口が増えることでゴルフをもっと盛り上げることができるのではないかと思い、このアプリを制作しました。

## AWS構成図
 ![myapp-infra](https://user-images.githubusercontent.com/86819225/187675633-af500eee-e986-4d90-9133-8361d30d416b.svg)

## ER図 
![myapp-er](https://user-images.githubusercontent.com/86819225/187675731-0f322559-2804-45d2-aa00-f6c966731b21.svg)

## 使用技術
**フロントエンド**
- Nuxt.js v2.15.7（SPAモード）
- Vuetify（UIフレームワーク）
- JavaScript
- CSS

**バックエンド**
- Ruby v3.0.3
- Ruby on Rails v6.1.5（APIモード）
- Rspec（テスト）
- MySQL v8.0

**インフラ**
- docker/docker-compose
- AWS (VPC / ECR / ECS(EC2) / RDS / Route53 / ACM / ALB / S3 / IAM)
- CircleCI (CI/CD)

## 工夫した点
- 完全SPA化
- 直感的に動かせるようにUIをマテリアルデザインで制作（Vuetify）
- middleware(Nuxt.js)でログインが必要なページのセキュリティを強化
- リロードした際も値が復帰するように、vuex-persistedstate / nuxt client init moduleを導入
- 練習場を素早く比較できるよう設置設備を一目でわかりやすくした
- レッスンの表示から予約を確定させるまでの導線を短くし、精神的な負荷を軽減
- 投稿では、どこの練習場を利用したかがわかるように練習場名をタグで表示

## 機能一覧
#### ユーザー側
`ユーザー機能`
- 新規ユーザー登録・退会
- ログイン・ログアウト/ゲストログイン
- アカウント設定（変更)
  - アバター画像・登録名・ユーザー名・メールアドレス・電話番号
- パスワード変更
- マイページ
  - 投稿・いいね・練習場ブックマーク・レッスン予約・レッスンレビュー一覧
- 他ユーザーページ
  - 投稿・いいね一覧
- フォロー
- フォロー・フォロワー一覧
- フォロー・フォロワー数表示

`練習場検索機能`
- 練習場一覧・詳細
- 練習場検索
- 練習場ブックマーク（作成・削除）

`投稿機能`
- 投稿（作成・削除）
- みんなの投稿一覧・詳細
- いいね（作成・削除）
- いいね数表示

`レッスン機能`
- レッスン予約（作成・削除）
- レッスンレビュー（作成・編集・削除）

#### 練習場管理者側
`管理者機能`
- 管理者ログイン・ログアウト
- 登録アカウント設定（編集）
  - 登録名・メールアドレス
- パスワード変更

`情報設定機能`
- 基本情報設定（作成・変更）
  - 市町村・練習場名・所在地・練習場の広さ・画像・特徴・打席数・HPリンク・電話番号
- 設備表示設定（作成・変更）
  - 打ち放題・アプローチ場・バンカー場・パターグリーン・左打席・ショップ・レストラン・レッスン

`レッスン機能`
- レッスン作成（作成・編集・削除）
  - レッスン時間・レッスン開始時間・休業日
- 予約状況確認

#### アプリ管理者側
- 練習場管理者新規登録・削除
- ユーザー・投稿の一覧表示・削除

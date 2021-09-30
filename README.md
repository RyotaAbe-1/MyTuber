# MyTuber

## サイト概要
自分のおすすめのYouTuberを投稿してフォロワーと意見交換したり、
好きなジャンルを登録して共通のジャンルを持つ人を見つけてフォローしたり、
他ユーザーのおすすめYouTuberを閲覧できるwebサービス。
見るyoutuberが固定化されている人や、これからyoutubeを利用していく人の手助けになれば幸いである。

### サイトテーマ
おすすめのYoutuberのレビューを投稿し、似たようなジャンルが好きな人と共有し合えるsns風レビューサイト。

### テーマを選んだ理由
YouTuberは現在小学生のなりたい職業ランキングで上位になるほど人気があり、YouTuberの人口も増え続けている。
しかし現状YouTuber市場は飽和状態で、すでに固定ファンを獲得している古参に比べ、新規参入者が生き残るのは難しくなっている。
このような状況を打開し、本当に面白い動画を上げている人が生き残るべきであると考えたためこのサービスを考えた。

### ターゲットユーザ
YouTubeを見ていてかつSNSを利用する人(主に若年層)

### 主な利用シーン
このYouTuberは面白いと感じた時や、このYouTuberがおすすめであると発信したくなった時。
また、新しく面白いyoutuberを探したいと思った時。

## URL
- https://mytuber.site

- テストユーザー
    - メールアドレス：test@gmail.com
    - パスワード：111111

## 設計書
・機能一覧
![pf_機能](https://user-images.githubusercontent.com/85055215/128303781-ccaadd78-d73d-4e41-af65-be81a87ea330.jpg)
・er図
![pf_er (new)](https://user-images.githubusercontent.com/85055215/134434936-b5c5881e-dd24-4de5-8690-0e20c4a939b3.png)

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1YGDH1a3zvSwrRfFufOaR_6SkBiZQgjOnr5dvkLhpzOU/edit?usp=sharing

## 各種機能(使用技術)
- ユーザー認証(devise)
- 画像アップロード(refile, refile-mini_magick)
- レビュー(raty.js)
- フォロー、お気に入り機能(Ajax)
- ページネーション(kaminari)
- テスト(Rspec, factory_bot, faker)
- コードチェック(rubocop-airbnb, bullet, pry-byebug)
- SNS認証(omniauth)
- 各種API(Google, Twitter, Yahoo)
- 自動デプロイ(GitHub Actions)

## 開発環境
- OS：Amazon Linux2
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

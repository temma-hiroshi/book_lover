# BookLover  
Bookloverは好きな本を共有できるサイトです。  
ユーザー登録すれば、自分の好きな本を登録することができます。  
他のユーザーが登録した本は誰でも見ることができます。  
![ホームページ](https://github.com/temma-hiroshi/book_lover/blob/develop_rakuten/app/assets/images/toppage.png)  
ホーム画面下部の画像をクリックすると、おすすめのジャンルを検索できます。
![おすすめ](https://github.com/temma-hiroshi/book_lover/blob/develop_rakuten/app/assets/images/recommend.png)  
本の詳細画面では、他の方の感想をみることができます。  
![本の詳細](https://github.com/temma-hiroshi/book_lover/blob/develop_rakuten/app/assets/images/book_show.png) 


# URL  
https://portfolio-temma.herokuapp.com/  
画面上部のハンバーガーメニューを開き、ゲストログインボタンを押すと、名前、メールアドレス、パスワードを入力せずにログインできます。  

# 使用技術
- Ruby
- Ruby on Rails
- MySQL
- AWS S3
- Docker
- CircleCI
- RSpec
- Rubocop

# ER図
![ER図](https://github.com/temma-hiroshi/book_lover/blob/develop_rakuten/app/assets/images/ERD(BookLover).png)  

# CircleCI  
Githubへのpush時に、RubocopとRSpecが自動で実行され、どちらも成功した場合、herokuへ自動デプロイが実行されます。  

# 機能一覧
- ユーザー登録、ログイン機能(devise)
- 本の登録機能
- 画像投稿機能(activestorage,AWS S3)
- コメント投稿機能
- 検索機能(ransack)
- 楽天検索機能(rakuten_web_service)

# テスト
- RSpec
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(system)
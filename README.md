# BookLover  
Bookloverは好きな本を共有できるサイトです。  
ユーザー登録すれば、自分の好きな本を登録することができます。  
他のユーザーが登録した本は誰でも見ることができます。  

# URL  
https://portfolio-temma.herokuapp.com/  
ゲストログインボタンから、名前、メールアドレス、パスワードを入力せずにログインできます。  

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

# CirCleCI  
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
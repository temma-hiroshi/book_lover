require 'rails_helper'

RSpec.describe "UserのE2Eテスト", type: :system do
  describe "ユーザーページのテスト" do
    let(:signup_user) { build(:user) }
    let(:user) { create(:user) }
    let!(:book) { create(:book, user_id: user.id) }
    let!(:comment) { create(:comment, user_id: user.id, book_id: book.id) }

    it "新規登録を実行すること" do
      visit new_user_registration_path
      within ".container" do
        fill_in "名前", with: signup_user.name
        fill_in "メールアドレス", with: signup_user.email
        fill_in "パスワード(6文字以上)", with: signup_user.password
        fill_in "パスワード(確認用)", with: signup_user.password_confirmation
        click_on '新規登録'
      end
      expect(User.all.count).to eq 1
    end

    it "ログインを実行すること" do
      visit new_user_session_path
      within ".container" do
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        click_on 'ログイン'
      end
      expect(current_path).to eq(root_path)
      expect(page).to have_content("ログインしました。")
    end

    describe "ログイン後のテスト" do
      before do
        sign_in user
      end

      it "ログアウトを実行すること" do
        visit root_path
        click_on "ログアウト"
        expect(current_path).to eq(root_path)
        expect(page).to have_content("ログアウトしました。")
      end

      it "ユーザー詳細画面で本の情報を表示すること" do
        visit user_path(user.id)
        within ".book-container" do
          expect(page).to have_content(book.title)
          expect(page).to have_content(book.author)
          expect(page).to have_content(book.description)
        end
      end

      it "ユーザー詳細画面の本のリンクが機能すること" do
        visit user_path(user.id)
        within ".book-container" do
          click_on book.title
        end
        expect(current_path).to eq(book_path(book.id))
      end

      it "ユーザー詳細画面のコメント編集のリンクが機能すること" do
        visit user_path(user.id)
        within ".comment-container" do
          click_on "編集"
        end
        expect(current_path).to eq(edit_comment_path(comment.id))
      end
    end
  end
end

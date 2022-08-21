require 'rails_helper'

RSpec.describe "UserのE2Eテスト", type: :system do
  describe "GET /home" do
    let(:signup_user) { build(:user) }
    let(:user) { create(:user) }

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

    it "ログイン、ログアウトを実行すること" do
      visit new_user_session_path
      within ".container" do
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        click_on 'ログイン'
      end
      expect(current_path).to eq(root_path)
      expect(page).to have_content("ログインしました。")
      click_on "ログアウト"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("ログアウトしました。")
    end
  end
end

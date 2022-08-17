require 'rails_helper'

RSpec.describe "UserのE2Eテスト", type: :system do
  describe "GET /home" do
    let(:signup_user) {build(:user)}
    let(:user) {create(:user)}

    it "新規登録を実行すること" do
      visit new_user_registration_path
      fill_in "Name",  with: signup_user.name
      fill_in "Email",  with: signup_user.email
      fill_in "Password", with: signup_user.password
      fill_in "Password confirmation", with: signup_user.password
      click_on 'Sign up'
      expect(User.all.count).to eq 1
    end

    it "ログイン、ログアウトを実行すること" do
      visit new_user_session_path
      fill_in "Email",  with: user.email
      fill_in "Password", with: user.password
      click_on 'Log in'
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Signed in successfully.")
      click_on "ログアウト"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Signed out successfully")
    end
  end
end

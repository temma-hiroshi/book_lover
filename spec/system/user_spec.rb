require 'rails_helper'

RSpec.describe "UserのE2Eテスト", type: :system do
  describe "GET /home" do
    let(:user) {build(:user)}

    it "新規登録、ログアウト、ログインを実行すること" do
      visit new_user_registration_path
      fill_in "Email",  with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_on 'Sign up'
      expect(current_path).to eq(root_path)
      click_on 'ログアウト'
      expect(current_path).to eq(root_path)
      click_on 'ログイン'
      fill_in "Email",  with: user.email
      fill_in "Password", with: user.password
      click_on 'Log in'
      expect(current_path).to eq(root_path)
    end
  end
end

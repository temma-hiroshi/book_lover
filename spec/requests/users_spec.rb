require 'rails_helper'

RSpec.describe "users", type: :request do
  let(:user) { create(:user) }

  describe "GET /users" do
    it "ログイン画面で正常にレスポンスを返答すること" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end

    it "新規登録画面で正常にレスポンスを返答すること" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end

    describe "ログイン時のテスト" do
      before do
        sign_in user
      end

      it "名前、アイコン編集画面で正常にレスポンスを返答すること" do
        get edit_user_path(user.id)
        expect(response).to have_http_status(200)
      end

      it "ユーザー情報画面で正常にレスポンスを返答すること" do
        get user_path(user.id)
        expect(response).to have_http_status(200)
      end

      it "パスワード編集画面で正常にレスポンスを返答すること" do
        get edit_user_registration_path
        expect(response).to have_http_status(200)
      end
    end
  end
end

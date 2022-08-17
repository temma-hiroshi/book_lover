require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Userモデルのテスト" do
    let(:user) {build(:user)}
    let(:noname_user) {build(:user, name: "")}
    let(:short_password_user) {build(:user, password: "12345")}
    let(:unpermitted_email_user) {build(:user, email: "test-email")}


    it "名前、メール、6文字以上のパスワードがあれば登録すること" do
      expect(user).to be_valid
    end

    it "名前がないユーザーは登録しないこと" do
      expect(noname_user).to be_invalid
    end

    it "メールアドレスの形式が正しくないユーザーは登録しないこと" do
      expect(unpermitted_email_user).to be_invalid
    end

    it "パスワードが5文字以下のユーザーは登録しないこと" do
      expect(short_password_user).to be_invalid
    end
  end
end

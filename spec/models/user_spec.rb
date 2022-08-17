require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Userモデルのテスト" do
    let(:user) {create(:user)}

    it "名前、メール、6文字以上のパスワードがあれば登録すること" do
      expect(user).to be_valid
    end
  end
end

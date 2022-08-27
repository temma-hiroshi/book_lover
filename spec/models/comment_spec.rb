require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Commentモデルのテスト" do
    let(:user) { create(:user) }
    let(:book) { create(:book, user_id: user.id) }
    let(:comment) { build(:comment, user_id: user.id, book_id: book.id) }
    let(:no_comment) { build(:comment, comment: "", user_id: user.id, book_id: book.id) }

    it "コメントがある場合は登録できること" do
      expect(comment).to be_valid
    end

    it "コメントがない場合は登録できないこと" do
      expect(no_comment).to be_invalid
    end
  end
end

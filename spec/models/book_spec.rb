require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Bookモデルのテスト" do
    let(:user) { create(:user) }
    let!(:book) { build(:book, user_id: user.id) }
    let(:no_title_book) { build(:book, title: "", user_id: user.id) }
    let(:no_author_book) { build(:book, author: "", user_id: user.id) }
    let(:no_description_book) { build(:book, description: "", user_id: user.id) }

    it "タイトル、著者、説明文がある場合は登録すること" do
      expect(book).to be_valid
    end

    it "タイトルがない場合、登録しないこと" do
      expect(no_title_book).to be_invalid
    end

    it "著者がない場合は登録しないこと" do
      expect(no_author_book).to be_invalid
    end

    it "説明文がない場合は登録しないこと" do
      expect(no_description_book).to be_invalid
    end
  end
end

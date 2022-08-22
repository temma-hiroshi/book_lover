require 'rails_helper'

RSpec.describe "BookのE2Eテスト", type: :system do
  describe "本の詳細ページのテスト" do
    let(:user) { create(:user) }
    let(:book) { create(:book, user_id: user.id) }

    before do
      visit book_path(book.id)
    end

    it "本の詳細ページにタイトル、著者、説明文を表示すること" do
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.author)
      expect(page).to have_content(book.description)
    end

    it "本の詳細ページに登録ユーザー名を表示すること" do
      expect(page).to have_content(book.user.name)
    end
  end
end

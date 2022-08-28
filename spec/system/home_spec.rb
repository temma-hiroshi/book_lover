require 'rails_helper'

RSpec.describe "HomeのE2Eテスト", type: :system do
  describe "view/homeのテスト" do
    let(:user) { create(:user) }
    let!(:nobel_book) { create(:book, title: "小説", user_id: user.id) }
    let!(:business_book) { create(:book, title: "ビジネス", user_id: user.id) }
    let!(:health_book) { create(:book, title: "健康", user_id: user.id) }
    let!(:money_book) { create(:book, title: "お金", user_id: user.id) }

    before do
      visit home_index_path
    end

    it "あなたの好きを、誰かの好きに。と表示すること" do
      expect(page).to have_content("あなたの好きを、誰かの好きに。")
    end

    it "小説の画像をクリックしたとき、小説と検索した結果を表示すること" do
      click_on "小説"
      expect(current_path).to eq search_books_path
      expect(page).to have_content nobel_book.title
    end

    it "ビジネスの画像をクリックしたとき、ビジネスと検索した結果を表示すること" do
      click_on "ビジネス"
      expect(current_path).to eq search_books_path
      expect(page).to have_content business_book.title
    end

    it "健康の画像をクリックしたとき、健康と検索した結果を表示すること" do
      click_on "健康"
      expect(current_path).to eq search_books_path
      expect(page).to have_content health_book.title
    end

    it "お金の画像をクリックしたとき、お金と検索した結果を表示すること" do
      click_on "お金"
      expect(current_path).to eq search_books_path
      expect(page).to have_content money_book.title
    end
  end
end

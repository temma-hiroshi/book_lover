require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /new" do
    let(:user) { create(:user) }
    let(:book) { create(:book, user_id: user.id) }

    it "本の詳細画面でレスポンスを返答すること" do
      get book_path(book.id)
      expect(response).to have_http_status(200)
    end

    describe "ログイン時のテスト" do
      before do
        sign_in user
      end

      it "本の登録画面でレスポンスを返答すること" do
        get new_book_path(book.id)
        expect(response).to have_http_status(200)
      end

      it "本の編集画面でレスポンスを返答すること" do
        get edit_book_path(book.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /create" do
    let!(:user) { create(:user) }
    let!(:book) { create(:book, user_id: user.id) }
    let!(:comment) { create(:comment, user_id: user.id, book_id: book.id) }

    it "コメントを削除すること" do
      expect { comment.destroy }.to change { Comment.count }.from(1).to(0)
    end

    it "ユーザーを削除したとき、コメントを削除すること" do
      expect { user.destroy }.to change { Comment.count }.from(1).to(0)
    end

    it "本を削除したとき、コメントを削除すること" do
      expect { book.destroy }.to change { Comment.count }.from(1).to(0)
    end
  end
end

# editのビューをリクエストしたら成功すること

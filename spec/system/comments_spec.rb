require 'rails_helper'

RSpec.describe "CommentのE2Eテスト", type: :system do
  describe "view/commentsのテスト" do
    let(:user) { create(:user) }
    let!(:book) { create(:book, user_id: user.id) }
    let!(:comment) { create(:comment, user_id: user.id, book_id: book.id) }

    describe "編集ページのテスト" do
      before do
        visit edit_comment_path(comment.id)
      end

      it "コメントを入力したとき、更新に成功すること" do
        within ".edit-container" do
          fill_in "コメント", with: "update_comment"
          click_on 'コメントの更新'
        end
        expect(page).to have_content("コメントを更新しました。")
      end

      it "コメントが未入力のとき、更新に失敗すること" do
        within ".edit-container" do
          fill_in "コメント", with: ""
          click_on 'コメントの更新'
        end
        expect(page).to have_content("コメントを更新できませんでした。")
      end
    end
  end
end

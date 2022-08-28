require 'rails_helper'

RSpec.describe "CommentのE2Eテスト", type: :system do
  describe "view/commentsのテスト" do
    let(:user) { create(:user) }
    let!(:another_user) { create(:user, email: "another@another.jp") }
    let!(:book) { create(:book, user_id: user.id) }
    let!(:comment) { create(:comment, user_id: user.id, book_id: book.id) }
    let!(:another_comment) { create(:comment, user_id: another_user.id, book_id: book.id) }

    it "ログインユーザーが投稿者でない場合、編集画面のアクセスに失敗すること" do
      sign_in another_user
      visit edit_comment_path(comment.id)
      expect(current_path).to eq root_path
      expect(page).to have_content("投稿者でないため、コメントを編集できません。")
    end

    describe "編集ページの正常系テスト" do
      before do
        sign_in user
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

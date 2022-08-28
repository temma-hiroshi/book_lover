require 'rails_helper'

RSpec.describe "BookのE2Eテスト", type: :system do
  describe "view/booksのテスト" do
    let(:user) { create(:user) }
    let(:another_user) { create(:user, name: "another_user", email: "anotheruser@another.jp") }
    let!(:book) { create(:book, user_id: user.id) }

    describe "詳細ページのテスト" do
      before do
        visit book_path(book.id)
      end

      it "タイトル、著者、説明文を表示すること" do
        expect(page).to have_content(book.title)
        expect(page).to have_content(book.author)
        expect(page).to have_content(book.description)
      end

      it "登録ユーザー名を表示すること" do
        expect(page).to have_content(book.user.name)
      end

      it "登録ユーザーでない場合、本の詳細ページに編集を表示しないこと" do
        sign_in another_user
        expect(page).not_to have_content("編集")
      end

      it "登録ユーザーの場合、本の詳細ページに編集を表示し、リンクが機能すること" do
        sign_in user
        visit book_path(book.id)
        expect(page).to have_content("編集")
        click_on "編集"
        expect(current_path).to eq edit_book_path(book.id)
      end
    end

    describe "編集ページのテスト" do
      it "ログインユーザーが本の登録ユーザーでない場合、アクセスに失敗すること" do
        sign_in another_user
        visit edit_book_path(book.id)
        expect(current_path).to eq root_path
        expect(page).to have_content("本の登録ユーザーでないため、本を編集できません。")
      end

      describe "編集ページの入力テスト" do
        before do
          sign_in user
          visit edit_book_path(book.id)
        end

        it "タイトル、著者、説明文を入力したとき、更新に成功すること" do
          within ".form-container" do
            fill_in "タイトル", with: "update_title"
            fill_in "著者", with: "update_author"
            fill_in "説明文", with: "update_description"
            click_on '本の更新'
          end
          expect(page).to have_content("本の情報を更新しました。")
        end

        it "タイトルが未入力のとき、更新に失敗すること" do
          within ".form-container" do
            fill_in "タイトル", with: ""
            fill_in "著者", with: "update_author"
            fill_in "説明文", with: "update_description"
            click_on '本の更新'
          end
          expect(page).to have_content("本の情報を更新できませんでした。")
        end

        it "著者が未入力のとき、更新に失敗すること" do
          within ".form-container" do
            fill_in "タイトル", with: "update_title"
            fill_in "著者", with: ""
            fill_in "説明文", with: "update_description"
            click_on '本の更新'
          end
          expect(page).to have_content("本の情報を更新できませんでした。")
        end

        it "説明文が未入力のとき、更新に失敗すること" do
          within ".form-container" do
            fill_in "タイトル", with: "update_title"
            fill_in "著者", with: "update_author"
            fill_in "説明文", with: ""
            click_on '本の更新'
          end
          expect(page).to have_content("本の情報を更新できませんでした。")
        end
      end
    end

    describe "検索フォームのテスト" do
      before do
        visit root_path
      end

      it "検索ワードにタイトルを含むとき、本の情報を表示すること" do
        fill_in "q[title_or_author_or_description_cont]", with: "title"
        click_on '検索'
        expect(current_path).to eq search_books_path
        expect(page).to have_content(book.title)
        expect(page).to have_content(book.author)
        expect(page).to have_content(book.description)
      end

      it "検索ワードに著者を含むとき、本の情報を表示すること" do
        fill_in "q[title_or_author_or_description_cont]", with: "author"
        click_on '検索'
        expect(current_path).to eq search_books_path
        expect(page).to have_content(book.title)
        expect(page).to have_content(book.author)
        expect(page).to have_content(book.description)
      end

      it "検索ワードに説明文を含むとき、本の情報を表示すること" do
        fill_in "q[title_or_author_or_description_cont]", with: "description"
        click_on '検索'
        expect(current_path).to eq search_books_path
        expect(page).to have_content(book.title)
        expect(page).to have_content(book.author)
        expect(page).to have_content(book.description)
      end

      it "検索ワードにタイトル、著者、説明文を含まないとき、本の情報を表示しないこと" do
        fill_in "q[title_or_author_or_description_cont]", with: "foobar"
        click_on '検索'
        expect(current_path).to eq search_books_path
        expect(page).not_to have_content(book.title)
        expect(page).not_to have_content(book.author)
        expect(page).not_to have_content(book.description)
      end
    end
  end
end

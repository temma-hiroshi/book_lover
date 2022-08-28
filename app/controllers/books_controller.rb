class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
    @book_comments = @book.comments.includes([:user])
  end

  def new
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "本を登録しました。"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "本を登録できませんでした。"
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      flash[:alert] = "本の登録ユーザーでないため、コメントを編集できません。"
      redirect_to root_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "本の情報を更新しました。"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "本の情報を更新できませんでした。"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @user = @book.user
    if @book.destroy
      flash[:notice] = "本を削除しました。"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "本を削除できませんでした。"
      redirect_to user_path(@user.id)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :user_id, :image)
  end
end

class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def show
    @book = Book.find(params[:id])
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
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :description, :user_id, :image)
  end
end

class CommentsController < ApplicationController
  def create
    @book = Book.find(comment_params[:book_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
    else
      flash[:alert] = "コメントを投稿できませんでした。"
    end
    redirect_to book_path(@book.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :book_id)
  end
end

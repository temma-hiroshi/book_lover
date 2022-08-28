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
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "コメントを削除できませんでした。"
      redirect_to root_path(current_user.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :book_id)
  end
end

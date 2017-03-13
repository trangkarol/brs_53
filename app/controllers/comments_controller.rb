class CommentsController < ApplicationController
  before_action :load_comment, only: [:destroy, :update]

  def create
    @comment = Comment.new comment_params
    if @comment.save
      flash[:success] = t "view.comment.comment_success"
    else
      flash[:danger] = t "view.comment.comment_not_success"
    end
    redirect_to :back
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "view.comment.delete_completed"
    else
      flash[:waring] = t "view.commt.delete_not_complete"
    end
    redirect_to :back
  end

  def update
    if @comment.update_attributes comment_params
      flash[:success] = t "view.comment.update_completed"
    else
      flash[:waring] = t "view.commt.update_not_complete"
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit :content, :review_id, :book_id, :user_id
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment
    flash[:waring] = t "view.comment.not_found"
    redirect_to :back
  end
end

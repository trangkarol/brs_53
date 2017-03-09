class ReviewsController < ApplicationController
  before_action :load_review, only: [:destroy, :update]

  def create
    @review = Review.new review_params
    if @review.save
      flash[:success] = t "view.review.review_success"
    else
      flash[:danger] = t "view.review.review_not_success"
    end
    redirect_to :back
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = t "view.review.update_success"
    else
      flash[:danger] = t "view.review.review_not_blank"
    end
    redirect_to :back
  end

  def destroy
    if @review.destroy
      flash[:success] = t "view.review.delete_success"
    else
      flash[:danger] = t "view.review.delete_not_success"
    end
    redirect_to :back
  end

  private

  def load_review
    @review = Review.find_by id: params[:id]
    return if @review
    flash[:warning] = t "view.review.not_found_review"
    redirect_to :back
  end

  def review_params
    params.require(:review).permit(:title, :book_id, :content, :rate_score)
      .merge user_id: current_user.id
  end
end

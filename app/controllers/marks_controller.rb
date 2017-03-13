class MarksController < ApplicationController
  before_action :load_mark, only: [:update, :destroy]
  after_filter  :activity_create, only: [:create, :update]

  def create
    @bookmark = Mark.new bookmark_params
    if @bookmark.save
      flash[:success] = t "view.mark.mark_book_success"
    else
      flash[:danger] = t "view.mark.mark_book_not_success"
    end
    redirect_to :back
  end

  def update
    if @bookmark.update_attributes bookmark_params
      flash[:success] = t "view.mark.change_success"
    else
      flash[:success] = t "view.mark.change_not_success"
    end
    redirect_to :back
  end

  def destroy
    if @bookmark.destroy
      flash[:success] = t "view.mark.unmark_success"
    else
      flash[:warning] = t "view.mark.unmark_not_success"
    end
    redirect_to :back
  end

  private

  def activity_create
    if @bookmark.status?
      @target_type = "mark_reading"
    else
      @target_type = "mark_readed"
    end
    @activity = Activity.new(user_id: @bookmark.user_id, target_type: @target_type,
      target_id: @bookmark.id, action_type: "created")
    @activity.save
  end

  def bookmark_params
    params.require(:mark).permit :status, :user_id, :book_id
  end

  def load_mark
    @bookmark = Mark.find_by id: params[:id]
    return if @bookmark
    flash[:warning] = t "not_found_mark"
    redirect_to :back
  end
end

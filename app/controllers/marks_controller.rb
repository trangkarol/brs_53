class MarksController < ApplicationController
  before_action :logged_in_user
  before_action :load_mark, only: [:update, :destroy]

  def index
    @bookmarks = Mark.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    @bookmark = Mark.new bookmark_params
    if @bookmark.save
      @bookmark.status? ? action_type = "mark_reading" : action_type = "mark_readed"
      create_activity @bookmark.id, action_type
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
      @bookmark.status? ? action_type = "mark_reading" : action_type = "mark_readed"
      destroy_activity @bookmark.id, action_type
      flash[:success] = t "view.mark.unmark_success"
    else
      flash[:warning] = t "view.mark.unmark_not_success"
    end
    redirect_to :back
  end

  private

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

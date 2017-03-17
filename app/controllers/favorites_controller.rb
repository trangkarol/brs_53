class FavoritesController < ApplicationController
  before_action :load_user, only: [:index, :create, :destroy]
  before_action :load_favorite, only: :destroy
  before_action :load_book, only: [:create, :destroy]

  def index
    @favorites = Favorite.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    @favorite = Favorite.new favorite_params
    if @favorite.save
      like_success = true
    end
    respond_to do |format|
      format.json {
        render json: {favorite_id: @favorite.id, like_success: like_success}
      }
    end
  end

  def destroy
    if @favorite.destroy
      dislike_success = true
    end
    dislike_success = true
    respond_to do |format|
      format.json {
        render json: {dislike_success: dislike_success}
      }
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:book_id]
    return if @book
    flash[:warning] =  t "app.controllers.not_found"
    redirect_to :back
  end

  def favorite_params
    params.permit :book_id, :user_id
  end

  def load_favorite
    @favorite = Favorite.find_by id: params[:id]
    return if @favorite
    flash[:warning] = t "app.controllers.not_found"
    redirect_to :back
  end

  def load_user
    if logged_in?
      @user = User.find_by id: current_user.id
      return if @user
      flash[:warning] = t "app.controllers.not_found_user"
      redirect_to :back
    end
  end
end

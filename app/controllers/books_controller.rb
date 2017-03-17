class BooksController < ApplicationController
  before_action :load_book, only: :show
  before_action :load_favorites, only: :show
  before_action :load_user, only: :show

  def index
    @categories = Category.all
    @books = Book.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page_book
    if params[:search]
      @books = Book.search_all(params[:search]).list_newest_desc.
        paginate page: params[:page], per_page: Settings.per_page_book
    else params[:input_search]
      case
      when params[:find_by] == t("view.search.title")
        @books = Book.search_title(params[:input_search]).list_newest_desc.
          paginate page: params[:page], per_page: Settings.per_page_book
      when params[:find_by] == t("view.search.author")
        @books = Book.search_author(params[:input_search]).list_newest_desc.
          paginate page: params[:page], per_page: Settings.per_page_book
      else
        @books = Book.search_rating(params[:input_search]).list_newest_desc.
          paginate page: params[:page], per_page: Settings.per_page_book
      end
    end
  end

  def show
    @favorite = Favorite.new
    @mark = Mark.new
    @marks = Mark.all
    @bookmarks = Mark.check_user_book current_user, @book.id
    @review = Review.new
    @comment = Comment.new
    @comments = @book.comments.list_newest_desc
    @reviews = @book.reviews.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page_review
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "view.review.not_found"
    redirect_to root_path
  end

  def load_favorites
    @favorites = Favorite.check_favorite_for_user current_user, @book.id
    return if @favorites
    flash[:warning] = t "app.controllers.not_found"
    redirect_to :back
  end

  def load_user
    if logged_in?
      @user = User.find_by id: current_user.id
      return if @user
      flash[:warning] = t "app.controllers.not_found_user"
      redirect_to root_path
    end
  end
end

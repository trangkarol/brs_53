class BooksController < ApplicationController
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
end

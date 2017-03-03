class Admin::BooksController < ApplicationController
  before_action :verify_admin?
  before_action :load_book, only: [:edit, :destroy, :update]
  before_action :load_category, exept: [:show, :destroy]

  layout "admin"

  def index
    @book = Book.new
    @books = Book.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "view.admin.add_book_success"
    else
      flash[:danger] = t "view.admin.add_book_fail"
    end
    redirect_to admin_books_path
  end

  def destroy
    if @book.destroy
      flash[:success] = t "view.admin.delete_completed"
    else
      flash[:danger] = t "view.admin.delete_not_complete"
    end
    redirect_to admin_books_path
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "view.admin.update_success"
    else
      flash[:danger] = t "view.admin.category_not_blank"
    end
    redirect_to  admin_books_path
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:warning] = t "view.admin.book_not_found"
    redirect_to admin_books_path
  end

  def book_params
    params.require(:book).permit :title, :introduction, :category_id, :author,
      :publish_date, :page_number, :picture
  end

  def load_category
    @categories = Category.all
  end
end

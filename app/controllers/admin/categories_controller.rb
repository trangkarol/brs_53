class Admin::CategoriesController < ApplicationController
  before_action :verify_admin?
  before_action :load_category, only: [:edit, :destroy, :update]

  layout "admin"

  def index
    @category = Category.new
    @categories = Category.list_category_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @category.destroy
      flash[:success] = t "view.admin.delete_completed"
    else
      flash[:danger] = t "view.admin.delete_not_complete"
    end
    redirect_to admin_categories_path
  end

  def new
    @categories = Category.new
  end

  def update
    if @category.update_attributes category_param
      flash[:success] = t "view.admin.update_success"
    else
      flash[:danger] = t "view.admin.category_not_blank"
    end
    redirect_to  admin_categories_path
  end

  def create
    @category = Category.new category_param
    if @category.save
      flash[:success] = t "view.admin.create_success"
    else
      flash[:danger] = t "view.admin.category_not_blank"
    end
    redirect_to  admin_categories_path
  end

  private

  def category_param
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:warning] = t "view.admin.category_not_found"
      redirect_to admin_categories_path
    end
  end

end

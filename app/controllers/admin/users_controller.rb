class Admin::UsersController < ApplicationController
  before_action :verify_admin?
  before_action :load_user, only: [:edit, :destroy, :update]

  layout "admin"

  def index
    @user = User.new
    @users = User.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "view.admin.delete_completed"
    else
      flash[:danger] = t "view.admin.delete_not_complete"
    end
    redirect_to admin_users_path
  end

  def update
    if @user.update_attributes user_param
      flash[:success] = t "view.admin.update_success"
    else
      flash[:danger] = t "view.admin.update_not_completed"
    end
    redirect_to  admin_users_path
  end

  def create
    @user = User.new user_param
    if @user.save
      flash[:success] = t "view.admin.create_success"
    else
      flash[:danger] = t "view.admin.create_not_completed"
    end
    redirect_to  admin_users_path
  end

  private

  def user_param
    params.require(:user).permit :name, :email, :avatar, :password
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "view.admin.user_not_found"
    redirect_to admin_users_path
  end

end

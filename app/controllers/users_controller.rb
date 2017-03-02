class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  before_action :load_user, only: [:edit, :show, :update]
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t("view.user.hi") + "#{@user.name}, " + t("view.user.welcome")
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "app.controllers.update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = t "app.controllers.not_found_user"
      redirect_to root_path
    end
  end
end

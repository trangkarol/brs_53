class UsersController < ApplicationController
  before_action :load_user, only: :show
  def show
  end

  def new
  end
  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = t "app.controllers.not_find_user"
      redirect_to root_path
    end  
  end
end

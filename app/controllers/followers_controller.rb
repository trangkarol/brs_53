class FollowersController < ApplicationController
  before_action :load_user, only: [:index]

  def index
    @title = t "view.user.following_title"
    @users = @user.followers.paginate page: params[:page],
      per_page: Settings.per_page
  end

  private

  def load_user
    @user = User.find_by id: params[:user_id]
    return if @user
    flash[:warning] = t "app.controllers.not_found_user"
    redirect_to root_path
  end
end

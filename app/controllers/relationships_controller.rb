class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by id: params[:followed_id]
    current_user.follow @user
    create_activity @user.id, "follow"
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow @user
    destroy_activity @user.id, "follow"
    respond_to do |format|
      format.html
      format.js
    end
  end
end

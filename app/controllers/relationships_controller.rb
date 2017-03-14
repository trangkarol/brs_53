class RelationshipsController < ApplicationController
  before_action :logged_in_user
  after_filter  :activity_create, only: :create

  def create
    @user = User.find_by id: params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow @user
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def activity_create
    @activity = Activity.new(user_id: current_user.id, target_type: "follow",
      target_id: @user.id, action_type: "created")
    @activity.save
  end
end

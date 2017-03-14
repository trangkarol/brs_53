class ActivitiesController < ApplicationController

  def index
    @activities = Activity.list_newest_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end
end

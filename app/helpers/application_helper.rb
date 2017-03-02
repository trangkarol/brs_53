module ApplicationHelper
  def count_index id
    if params[:page].nil?
      page = 0
    else
      page = params[:page].to_i * Settings.per_page - Settings.per_page
    end
    id += page + Settings.number_increment_page
  end
end

module ApplicationHelper
  def count_index id
    if params[:page].nil?
      page = 0
    else
      page = params[:page].to_i * Settings.per_page - Settings.per_page
    end
    id += page.to_i + Settings.number_increment_page
  end

  def limit_show name
    name.truncate Settings.length_show
  end
end

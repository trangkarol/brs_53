module ApplicationHelper
  def count_index id
    if params[:page].nil?
      page = 0
    else
      page = params[:page].to_i * Settings.per_page - Settings.per_page
    end
    id += page + Settings.number_increment_page
  end

  def limit_show name
    name.truncate Settings.length_show
  end

  def display_status request
    case
    when request.pending?
      t "view.admin.pending"
    when request.accept?
      t "view.admin.accept"
    when request.reject?
      t "view.admin.reject"
    else
      t "view.admin.cancel"
    end
  end

  def display_rate rate
    count = Settings.init_count
    html_star = ""
    while count < rate.to_i
      html_star << Settings.star_rate_html
      count += Settings.asc_value_star
    end
    render html: html_star.html_safe
  end

  def display_mark mark
    if mark.status
      image_tag "reading.png", class: "img-reading"
    else
      image_tag "readed.png", class: "img-readed"
    end
  end
end

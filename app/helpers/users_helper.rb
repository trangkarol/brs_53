module UsersHelper

  def gravatar_for user
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def check_request user
    return if Request.find_by user_id: user
    return false
  end

  def check_bookmark user
    return if Mark.find_by user_id: user.id
    return false
  end
end

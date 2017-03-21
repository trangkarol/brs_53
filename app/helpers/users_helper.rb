module UsersHelper

  def gravatar_for user
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def check_request user
    Request.find_by user_id: user
  end

  def check_bookmark user
    Mark.find_by user_id: user.id
  end

  def check_user_favorite user_id
    user = User.find_by id: user_id
    Favorite.find_by user_id: (user.id) if user.present?
  end

  def get_favorite book_id
    favorite = Favorite.find_by book_id: book_id
    return favorite
  end

  def load_favorite_user user_id, book_id
    favorite_user = Favorite.find_by book_id: book_id, user_id: user_id
    return favorite_user
  end
end

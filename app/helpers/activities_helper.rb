module ActivitiesHelper
  def create_activity target_id, action_type
    @activity = current_user.activities.build action_type: action_type,
      target_id: target_id
    @activity.save
  end

  def destroy_activity target_id, action_type
    @activity = current_user.activities.find_by action_type: action_type,
      target_id: target_id
    @activity.destroy
  end

  def action action_type
    case action_type
    when "mark_readed"
      t "view.new_feed.mark_readed"
    when "mark_reading"
      t "view.new_feed.mark_reading"
    when "review"
      t "view.new_feed.review"
    when "comment"
      t "view.new_feed.comment"
    else
      t "view.new_feed.follow"
    end
  end

  def target action_type, target_id
    case action_type
    when "mark_reading", "mark_readed"
      mark = Mark.find_by id: target_id
      mark.book
    when "comment"
      Comment.find_by id: target_id
    when "review"
      review = Review.find_by id: target_id
      review.book
    else
      User.find_by id: target_id
    end
  end
end

module NotificationsHelper
  def post_notification(post)
    "#{t :'notifications.posted_a_new_post', :text => post.brief}"
  end
  
  def repost_notification(post)
    "#{t :'notifications.reposted_your_post', :text => post.brief}"
  end
  
  def comment_notification(post)
    "#{t :'notifications.commented_your_post', :text => post.brief}"
  end
  
  def mention_notification(post)
    if post.is_comment?
      "#{t :'notifications.mentioned_you_in_a_comment', :text => post.brief}"
    else
      "#{t :'notifications.mentioned_you_in_a_post', :text => post.brief}"
    end
  end
  
  def like_notification(post)
    "#{t :'notifications.liked_your_post', :text => post.brief}"
  end
end
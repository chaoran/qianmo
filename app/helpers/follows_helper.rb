module FollowsHelper
  def follow_notification(follow)
    text = ""
    if follow.pair
      text << I18n.t(:has_also_followed_you)
    else
      text << I18n.t(:has_followed_you)
    end
    if follow.friend
      text << ", " + I18n.t(:and_also)
      text << I18n.t(:added_you_as_friend)
    end
    text
  end
end
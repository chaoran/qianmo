module LikesHelper
  def like_label(post)
    content_tag :div, :class => "like-label" do
      html = ""
      # build a liked user list
      list = []
      if post.liked_users.include?(current_user)
        list << current_user
      end
      list += post.liked_users & current_user.friends
      # display the list
      if list.length > 0 # first one check if it is user himself
        user = list.shift
        html += link_to "#{user == current_user ? t('you') : user.name}", user_path(user)
        if list.length > 0 # users 1-5 display their name
          4.times do 
            html += link_to ", #{user.name}", user_path(user) if user = list.shift
          end
        end
        html += " <a href=\"#{post_likes_path(post)}\">"
        html += I18n.t(:etc, :num => post.liked_users.length) if list.length > 0 # users after 5 
        html += I18n.t(:clicked_like)
        html += "</a>"
      end
      html.html_safe
    end
  end
end

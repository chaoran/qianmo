class NotificationsController < AuthenticatedController
  def index
    @notifications = current_user.notifications
  end
  
  def update # mark_all_as_read
    current_user.notifications.update_all({:read => true}, {:read => false})
  end
end
class NotificationsController < AuthenticatedController
  def index
    @notifications = current_user.notifications
  end
end
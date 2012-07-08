class FriendEventsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if @user.followers.include?(current_user)
      @event = @user.friend_events.create!(:trigger => current_user, :event_type => "request")
    else
      flash[:error] = I18n.t("cannot_friend_him_if_you_are_not_his_follower")
      render "error"
    end
  end
  
  # mark an event as read
  def update
    @event = FriendEvent.find_by_id(params[:id])
    unless @event && @event.update_attribute(:consumed, true)
      render :nothing => true
    end
  end
  
  def destroy
    @event = FriendEvent.delete(params[:id])
    @count = current_user.friend_events.size
  end
end

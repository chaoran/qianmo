class FollowsController < ApplicationController
  before_filter :setup_user
  
  # post 
  def create
    @user.followers << current_user unless @user.followers.include?(current_user)
    @event = @user.friend_events.create!(:trigger => current_user, :event_type => "follow")
    @deleted_events = FriendEvent.delete_all(:receiver_id => current_user.id, 
                                             :event_type => "follow", 
                                             :trigger_id => @user.id)
    flash[:notice] = I18n.t('successfully_followed', :name => @user.name)
  end
  
  # delete
  def destroy
    if @user.friends.include?(current_user)
      render "error", :error => I18n.t('cannot_unfollow_a_friend')
    else
      @user.followers.delete(current_user)
      flash[:notice] = I18n.t('successfully_unfollowed', :name => @user.name)
      FriendEvent.delete_all(:receiver_id => @user.id, :trigger_id => current_user.id, 
                             :event_type => "follow")
    end
  end
  
  protected
  
  def setup_user
    @user = User.find(params[:user_id])
  end
end
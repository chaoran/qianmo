class FriendshipsController < ApplicationController
  before_filter :setup_user
  
  def create
    current_user.followers << @user unless current_user.followers.include?(@user)
    current_user.friends << @user unless current_user.friends.include?(@user)
    FriendEvent.delete_all(:trigger_id => @user.id, :receiver_id => current_user.id)
    @event = @user.friend_events.create!(:trigger => current_user, :event_type => "accepted")
    flash[:notice] = self.class.helpers.link_to(@user.name, user_profile_path(@user)).html_safe + 
                     " " + I18n.t(:became_your_friend)
  end

  def destroy
    current_user.friends.delete(@user)
    FriendEvent.delete_all(:trigger_id => @user.id, :receiver_id => current_user.id, 
                           :event_type => "accepted")
    flash[:notice] = I18n.t(:friendship_has_ended, :name => @user.name)
  end
  
  protected
  
  def setup_user
    @user = User.find(params[:user_id])
  end
end

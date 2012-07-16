class FriendshipsController < ApplicationController
  before_filter :setup_user
  
  def create
    if FriendRequest.find_by_id(params[:request_id])    
      # follow and friend
      @user.followers << current_user unless @user.followers.include?(current_user)
      @user.friends << current_user unless @user.friends.include?(current_user)
      # remove other friend requests from the same user
      FriendRequest.delete_all(:sender_id => @user.id, :user_id => current_user.id)
      # notify the other one
      @request = @user.friend_requests.create!(:sender => current_user)
      
      flash[:notice] = self.class.helpers.link_to(@user.name, user_profile_path(@user)).html_safe + 
                       " " + I18n.t(:became_your_friend)
    else
      render :nothing => true
    end
  end

  def destroy
    current_user.friends.delete(@user)
    FriendRequest.delete_all(:sender_id => @user.id, :user_id => current_user.id)
    flash[:notice] = I18n.t(:friendship_has_ended, :name => @user.name)
  end
  
  protected
  
  def setup_user
    @user = User.find(params[:user_id])
  end
end

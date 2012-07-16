class FriendRequestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if @user.followers.include?(current_user) # One need to be a follower to request friendship
      @request = @user.friend_request.create!(:sender => current_user)
    else
      flash[:error] = I18n.t("cannot_friend_him_if_you_are_not_his_follower")
      render "error"
    end
  end
  
  # mark an event as read
  def update
    @request = FriendRequest.find_by_id(params[:id])
    unless @request && @request.update_attribute(:read, true)
      render :nothing => true
    end
  end
  
  def destroy
    FriendRequest.delete(params[:id])
  end
end

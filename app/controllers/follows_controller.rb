class FollowsController < ApplicationController  
  before_filter :setup_user
  
  def index
    @follows = current_user.follows
  end
  
  def create
    @follow = Follow.new(:follower => current_user, :user => @user)
    @follow.pair = Follow.find_by_user_id_and_follower_id(current_user.id, @user.id)
    @follow.save
    if @follow.pair
      @follow.pair.update_attributes(:read => true, :pair_id => @follow.id)
    end 
    return render :nothing => true unless @follow.persisted?
  end
  
  def update
    if params[:read]
      Follow.update(params[:id], :read => true)
      return render :nothing => true
    elsif params[:friend]
      Follow.update(params[:id], :friend => params[:friend], :read => false)
    elsif params[:special]
      Follow.update(params[:id], :special => params[:special])
      return render :nothing => true
    end
  end
  
  # delete
  def destroy
    Follow.delete(params[:id])
  end
  
  protected
  def setup_user
    @user = User.find(params[:user_id])
  end
end
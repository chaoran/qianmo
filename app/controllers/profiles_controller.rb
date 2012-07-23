class ProfilesController < ApplicationController    
  def new
    @profile = current_user.build_profile()
  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      redirect_to user_profile_path current_user
    else
      render action: "new"
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      redirect_to user_profile_path current_user
    else
      render action: "edit"
    end
  end
  
  def show 
    @user = User.find(params[:user_id])
    @profile = @user.profile
    
    if params[:follow_id]
      Follow.update_all({:read => true}, {:id => params[:follow_id]})
    elsif params[:no]
      Notification.update_all({:read => true}, {:id => params[:no]})
    end
  end
  
  protected
  
  def setup_profile
    @profile = current_user.profile
    @profile = current_user.create_profile() if !@profile
  end
end

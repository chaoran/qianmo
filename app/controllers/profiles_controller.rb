class ProfilesController < ApplicationController    
  before_filter :setup_profile, :except => [:new, :create, :update]
  
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
    if @profile.update_attributes(params[:profile])
      redirect_to user_profile_path current_user
    else
      render action: "edit"
    end
  end
  
  protected
  
  def setup_profile
    @profile = current_user.profile
    @profile = current_user.create_profile() if !@profile
  end
end

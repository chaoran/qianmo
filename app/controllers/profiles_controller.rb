class ProfilesController < ApplicationController    
  def show
    if @profile.nil?
      @profile = current_user.create_profile()
    end
  end

  def new
    @profile = current_user.build_profile()
  end

  def edit
    @profile = if current_user.profile
      current_user.profile
    else
      current_user.build_profile
    end 
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
  
end

class AvatarsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :setup_profile
  
  def create
    if @profile.update_attributes(params[:profile])
      respond_to do |format|
        format.html { redirect_to edit_user_profile_avatar_path(current_user) }
        format.js { render 'edit', :layout => false }
      end
    else     
      respond_to do |format|
        format.html { redirect_to new_user_profile_avatar_path(current_user) }
        format.js { render 'new_with_error', :layout => false }
      end
    end
  end

  def new
    respond_to do |format|
      format.js { render :layout => false}
    end 
  end

  def edit
  end

  def update
    if @profile.update_attributes(params[:profile])
      respond_to do |format|
        format.html { redirect_to user_profile_path(current_user) }
        format.js { render 'edit', :layout => false }
      end
    else      
      #respond_to do |format|
      #  format.html { redirect_to 'edit' }
      #  format.js { render 'new', :layout => false }
      #end
    end
  end
end

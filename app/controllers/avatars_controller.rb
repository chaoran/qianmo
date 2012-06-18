class AvatarsController < ApplicationController
  before_filter :authenticate_user!
    
  def create
    if current_user.update_attributes(params[:user])
      respond_to do |format|
        format.html { redirect_to edit_user_avatar_path(current_user) }
        format.js { render 'edit', :layout => false }
      end
    else     
      respond_to do |format|
        format.html { redirect_to new_user_avatar_path(current_user) }
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
    if current_user.update_attributes(params[:user])
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

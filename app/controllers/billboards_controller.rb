class BillboardsController < ApplicationController
  before_filter :setup_page_and_check_ownership
  
  def new
    @billboard = @page.build_billboard()
  end

  def edit
    @billboard = @page.billboard
  end

  def create
    @billboard = @page.build_billboard(params[:billboard])
    respond_to do |format|
      if @billboard.save
        format.js { render 'update' }
      else
        format.js { render 'create_error' }
      end
    end
  end

  def update
    @billboard = @page.billboard
    respond_to do |format|
      if @billboard.update_attributes(params[:billboard])
        format.js { render 'update' }
      else
        format.js { render 'update_error' }
      end
    end
  end
  
  protected
  def setup_page_and_check_ownership
    @page = current_user.pages.find(params[:page_id])
    if @page.nil?
      respond_to do |format|
        format.js { render 'error', :alert => I18n.t(:no_privilege_or_does_not_exist) }
      end
    else
      @editable = true
    end
  end
end

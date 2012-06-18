class ImagesController < ApplicationController
  before_filter :setup_page_and_check_ownership

  def new
    if @page.image
      @image = @page.image
    else
      @image = @page.build_image()
    end
  end

  def create
    @image = @page.image
    respond_to do |format|
      if @image ? @image.update_attributes(params[:image])
                : @page.create_image(params[:image])
        format.js { render 'create' }
      else
        format.js { render 'create_error' }
      end
    end
  end
  
  protected
  def setup_page_and_check_ownership
    @page = current_user.pages.find(params[:page_id])
    if @page.nil?
      respond_to do |format|
        format.js { render 'create_error', :alert => I18n.t(:no_privilege_or_does_not_exist) }
      end
    else
      @editable = true
    end
  end
end

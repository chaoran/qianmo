class PageComponentsController < ApplicationController
  before_filter :setup_page_and_check_ownership
  
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
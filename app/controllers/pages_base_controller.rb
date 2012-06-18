class PagesBaseController < ApplicationController
  before_filter :setup_page
  before_filter :check_if_user_is_creator, :except :
  
  protected 
  
  def check_if_user_is_creator
    @editable = (current_user == @page.creator)
  end
end

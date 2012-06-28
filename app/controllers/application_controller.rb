class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :set_default_response_format
  before_filter :authenticate_user!
  after_filter :flash_headers, :unless => Proc.new {|c| c.request.xhr?}
  
  protected
  
  # used by Devise's navigational format requirement for AJAX request
  #def set_default_response_format
  #  request.format = 'html'.to_sym if request.format.nil?
  #end
  
  def flash_headers
    # This will discontinue execution if Rails detects that the request is not
    # from an AJAX request, i.e. the header wont be added for normal requests
    #return unless request.xhr?

    # Add the appropriate flash messages to the header, add or remove as
    # needed, but I think you'll get the point
    response.headers['x-flash'] = flash[:error]  unless flash[:error].blank?
    response.headers['x-flash'] = flash[:notice]  unless flash[:notice].blank?
    response.headers['x-flash'] = flash[:alert]  unless flash[:warning].blank?

    # Stops the flash appearing when you next refresh the page
    flash.discard
  end

  private
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_registration_path
  end
  
  def after_sign_in_path_for(resource)    
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', 
                          :only_path => false, :protocol => 'http')  
    sign_up_url = url_for(:action => 'new', :controller => 'accounts', 
                          :only_path => false, :protocol => 'http')
    if (request.referer && 
        request.referer != sign_up_url && 
        request.referer != sign_in_url && 
        request.referer != root_url)  
      request.referer
    else                                                                                                               
      user_profile_path(resource)   
    end  
  end
end

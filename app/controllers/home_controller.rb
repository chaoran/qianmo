class HomeController < AuthenticatedController  
  before_filter :alert_if_unconfirmed
  
  def show
    
  end
  
  protected
  

  
end

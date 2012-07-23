class HomeController < AuthenticatedController  
  before_filter :alert_if_unconfirmed
  
  def show
    
  end
  
  protected
  
  def alert_if_unconfirmed
    unless session[:confirmed]
      if current_user.account.confirmed?
        session[:confirmed] = true
      else
        flash.now[:alert] = view_context.unconfirmed_notification(current_user.account.email)
      end
    end
  end
  
end

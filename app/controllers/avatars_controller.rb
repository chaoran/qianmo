class AvatarsController < AuthenticatedController
  around_filter :capture_download_error, :only => [:create]
    
  def create
    @user = current_user
    if @user.update_attributes(params[:user])
      render 'edit'
    else
      render 'new'
    end
  end

  def new
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    redirect_to user_posts_path(@user)
  end
  
  protected
  def capture_download_error
    begin
      yield
    rescue CarrierWave::DownloadError
      @user.errors.add(:remote_avatar_url, I18n.t('errors.messages.invalid_remote_url'))
      render 'new'
    end
  end
end

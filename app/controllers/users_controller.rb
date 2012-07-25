class UsersController < AuthenticatedController  
  def show
    @user = User.find(params[:id])
    if params[:follow_id]
      Follow.update_all({:read => true}, {:id => params[:follow_id]})
      redirect_to user_path(@user)
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render 'update' 
    else
      render 'edit'
    end
  end
end
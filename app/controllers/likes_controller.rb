class LikesController < AuthenticatedController

  def create
    @post = Post.find(params[:id])
    @like = @post.likes.build(:user => current_user)    
    if @like.save 
      render 'update'
    else
      render :nothing => true 
    end   
  end
  
  def destroy
    @post = Post.find(params[:id])
    Like.delete_all(:user_id => current_user.id, :post_id => @post.id)
    render 'update'
  end
end

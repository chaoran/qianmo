class LikesController < ApplicationController
  before_filter :setup_likable
  def create
    @like = @likable.likes.build(:user => current_user)    
    if @like.save 
      render 'update'
    else
      render :nothing => true 
    end   
  end
  
  def destroy
    Like.delete_all(:user_id => current_user.id, :likable_id => @likable.id, 
                    :likable_type => @likable.class.to_s)
    render 'update'
  end
  
  def setup_likable
    case params[:type]
    when "post"
      @likable = Post.find(params[:id])
    when "comment"
      @likable = Comment.find(params[:id])
    end
  end
end

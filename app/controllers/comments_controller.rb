class CommentsController < AuthenticatedController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:post])
    @comment.user = current_user;
    if @comment.save
      render 'create'
    else
      render 'new'
    end
  end

  def destroy
    @comment = Post.find(params[:id])
    @comment.destroy
  end
end

class PostsController < AuthenticatedController
  before_filter :alert_if_unconfirmed
  # GET /:user_id/posts
  # GET /
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
      render :layout => "user"
    else
      @posts = current_user.stream_posts
      render :layout => "home"
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    if params[:notice]
      Notification.update_all({:read => true}, {:id => params[:notice]})
    end
  end

  # GET /posts/1/new 
  def new
    @post = Post.new
  end

  # GET /posts/1/edit Repost a post
  def edit
    @ancestor = Post.find(params[:id])
    @post = @ancestor.reposts.build
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js { render 'create_error' }
      end
    end
  end

  # DELETE /posts/1.js
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
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

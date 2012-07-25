class PostsController < AuthenticatedController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
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

  # PUT /posts/1.js
  def update
    @ancester = Post.find(params[:id])
    @post = @ancester.reposts.build(params[:post])
    if @post.save
      render 'update'
    else
      render 'edit'
    end
  end

  # DELETE /posts/1.js
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
end

class ArticlesController < AuthenticatedController
  def new
    @article = Article.new(:user => current_user)
  end
  
  def create
    @article = current_user.articles.build(params[:article])
    @article.publish = true if params[:publish]
    
    if @article.save
      redirect_to root_path, :notice => I18n.t(:'articles.saved_successfully', 
                                               :title => @article.title).html_safe
    else
      render 'new'
    end
  end
  
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @articles = @user.articles
      render :layout => 'user'
    else
      @articles = current_user.articles
      render :layout => 'home'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.publish = true if params[:publish]
    if @article.update_attributes(params[:article])
      if @article.publish
        redirect_to root_path
      else
        redirect_to articles_path
      end
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if params[:confirm]
      @article.destroy
      redirect_to articles_path, :notice => I18n.t(:'articles.deleted', 
                                                   :title => @article.title).html_safe
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @user = @article.user
    respond_to do |format|
      format.html { render :layout => "user" }
      format.js 
    end
  end
end
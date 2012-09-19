class PicturesController < AuthenticatedController 
  def new
    if current_user.galleries.length == 0
      @gallery = current_user.galleries.build(:title => I18n.t('pictures.default_gallery'))
    else
      @gallery = current_user.galleries.first
    end 
    @picture = @gallery.pictures.build
  end
  
  def create
    @picture = Picture.new(params[:picture])
    @post = @picture.post
    @post.user = current_user
    respond_to do |format|
      if @picture.save
        format.js { render 'posts/create' }
        format.html { redirect_to request.referer, :notice => I18n.t('pictures.posted') }
      else
        format.js { render 'new' }
        format.html { redirect_to request.referer, :error => I18n.t('pictures.post_failed')}
      end
    end
  end
  
  def update
    @picture = Picture.find(params[:id])
    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        @post = @picture.post
        format.js { render 'posts/create' }
        format.html { redirect_to root_path, :notice => I18n.t('pictures.posted') }
      else
        format.js { render 'edit' }
        format.html { redirect_to root_path, :error => I18n.t('pictures.post_failed')}
      end
    end
  end
  
  # list galleries
  def index
    @galleries = current_user.galleries
    render :layout => 'home'
  end
  
  # show gallery
  def show
    @picture = Picture.find(params[:id])
    @gallery = @picture.gallery
    @index = @gallery.pictures.index(@picture)
  end
  
  # delete a picture
  def destroy
  end
end 

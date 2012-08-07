class PicturesController < AuthenticatedController 
  def new
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(params[:picture])
    if @picture.save
      @post = @picture.build_post
      render 'edit'
    else
      render 'new'
    end
  end
  
  # new associated post
  def edit
  end
  
  # create associated post
  def update
    
  end
  
  # list galleries
  def index
  end
  
  # show gallery
  def show
  end
  
  # delete a picture
  def destroy
  end
end 

class AttributesController < PageComponentsController
  def edit
    @attributes = @page.attributes
  end

  def update
    if @page.update_attributes(params[:page])
      render 'update'     
    else
      render 'update_error'
    end
  end
end

class BillboardsController < ApplicationController
  def update
    @page = current_user.pages.find(params[:page_id])    
    @billboard = @page.billboard
    if @billboard.nil?
      @billboard = @page.build_billboard(params[:billboard])
      need_save = true
    end
    respond_to do |format|
      if need_save ? @billboard.save : @billboard.update_attributes(params[:billboard])
        format.js { render "update" }
      else
        format.js { render "update_error" }
      end
    end
  end
end

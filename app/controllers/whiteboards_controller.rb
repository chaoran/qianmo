class WhiteboardsController < ApplicationController
  def update
    @page = current_user.pages.find(params[:page_id])    
    @whiteboard = @page.whiteboard
    if @whiteboard.nil?
      @whiteboard = @page.build_whiteboard(params[:whiteboard])
      need_save = true
    end
    respond_to do |format|
      if need_save ? @whiteboard.save : @whiteboard.update_attributes(params[:whiteboard])
        format.js { render "update" }
      else
        format.js { render "update_error" }
      end
    end
  end
end 
class MentionEventsController < ApplicationController  
  # mark an event as read
  def update
    @event = MentionEvent.find_by_id(params[:id])
    if @event && @event.update_attribute(:consumed, true)
      render "update"
    else
      render :nothing => true
    end
  end
  
  def destroy
    @event = MentionEvent.delete(params[:id])
    render "destroy"
  end
end

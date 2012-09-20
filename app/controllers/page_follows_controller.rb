class PageFollowsController < ApplicationController
  def create
    @page = Page.find(params[:page_id])
    @page.followed_users << current_user
    flash.now[:notice] = I18n.t('pages.you_have_followed', :name => @page.title)
  end

  def destroy
    @page = Page.find(params[:page_id])
    @page.followed_users.delete(current_user)
    flash.now[:notice] = I18n.t('pages.you_have_unfollowed', :name => @page.title)
  end
end

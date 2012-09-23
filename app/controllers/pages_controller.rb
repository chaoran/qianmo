class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:show, :index]
    
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])
    @editable = (@page.user == current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new.js
  def new
    @page = Page.new
    respond_to do |format|
      format.js
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    case @page.category
    when "movie"
      @page.build_movie.title = @page.title if @page.movie.nil?
    when "book"
      @page.build_book.title = @page.title if @page.book.nil?
    when "album"
      @page.build_album.title = @page.title if @page.album.nil?
    end
    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    @page.user = current_user

    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_page_path(@page)}
        format.js   { render :js => "window.location = '#{edit_page_path(@page)}'" }
      else
        format.html { render action: "new" }
        format.js   { render action: "new" }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = current_user.pages.find(params[:id])
 
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to page_path(@page) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

end

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
    @editable = true if @page.creator == current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = current_user.pages.find(params[:id])
    
    if params[:component] 
      render "edit_" + params[:component]
    else
      respond_to do |format|
        format.html # edit.html.erb
        format.js { render 'edit' }
      end
    end
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    @page.creator = current_user

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = current_user.pages.find(params[:id])
    @component = params[:component]
    @editable = true
    
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.js { render @component + "_update" }
      else
        format.js { render @component + '_update_error' }
      end
    end
    else
      
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = current_user.pages.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
  
  protected
end

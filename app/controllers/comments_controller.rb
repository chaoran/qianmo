class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  # def index
  #   @comments = comment.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @comments }
  #   end
  # end

  # GET /comments/1
  # GET /comments/1.json
  # def show
  #   @comment = comment.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @comment }
  #   end
  # end

  # GET /comments/new
  # GET /comments/new.json
  # def new
  #   @comment = current_user.comments.build
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @comment }
  #   end
  # end

  # GET /comments/1/edit
  # def edit
  #   @comment = comment.find(params[:id])
  # end

  # comment /comments
  # comment /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user;
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'comment was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js { render 'create_error' }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
      format.js
    end
  end
end

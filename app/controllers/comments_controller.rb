class CommentsController < ApplicationController
  
  def new
   @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment]) 
    @comment.save
    redirect_to welcome_home_path
  end
end
class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to report_comments_path
    else
      render :new, status: :unprocessable_entity
  end

  def comment_params
    params.require(:report).permit(:description)
  end

end

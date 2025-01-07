class CommentsController < ApplicationController
  # before_action :set_report, only: [:new, :create]
  def new
    @comment = Comment.new
    @report = Report.find(params[:report_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @report = Report.find(params[:report_id])
    @comment.report = @report
    @comment.user = current_user
    # @comment = @report.comments.new(comment_params)
    if @comment.save
      redirect_to report_path(@report)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end

  # def set_report
  #   @report = Report.includes(:comments).where(user: current_user).find(params[:report_id])
  # end
end

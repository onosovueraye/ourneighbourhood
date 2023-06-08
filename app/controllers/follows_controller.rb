class FollowsController < ApplicationController

  def create
    @follow = Follow.new()
    @follow.user = current_user
    @follow.report = Report.find(params[:report_id])
    if @follow.save
      redirect_to report_path(@follow.report)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to report_path(@follow.report)
  end

end

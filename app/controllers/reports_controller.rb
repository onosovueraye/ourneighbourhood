class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
    @ticket = Ticket.new
    @comment = Comment.new
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    # raise
    if @report.save
      redirect_to reports_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
    redirect_to report_path(@report)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path, status: :see_other
  end

  def report_params
    params.require(:report).permit(:title, :description, :location, :category, :status, :votes, photos: [])
  end
end

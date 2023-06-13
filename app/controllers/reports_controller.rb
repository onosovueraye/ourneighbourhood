class ReportsController < ApplicationController

  def index

    # @reports = Report.order(:location, )
    #@reports = Report.all


    user_coordinates = Geocoder.coordinates(current_user.address)

    @reports = Report.near(user_coordinates, 8_000_000, order: 'distance')

    @reports_active = @reports.where.not(status: "Done")
    distances = []

    @reports_active.each do |report|
      distances.push(Geocoder::Calculations.distance_between(user_coordinates, [report.latitude, report.longitude]))
    end

    @markers = @reports_active.geocoded.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {report: report}),
        marker_html: render_to_string(partial: "marker", locals: {report: report})
      }
    end


  end

  def show
    @report = Report.find(params[:id])
    @ticket = Ticket.new
    @comment = Comment.new
    @follow = Follow.where(user: current_user, report: @report).first
    @markers = [
      {
        lat: @report.latitude,
        lng: @report.longitude,
        marker_html: render_to_string(partial: "marker", locals: {report: @report})
      }
    ]
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    # raise
    if @report.save
      redirect_to report_path(@report)
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
    @report.tickets.destroy_all
    @report.destroy
    redirect_to reports_path, status: :see_other
  end

  def report_params
    params.require(:report).permit(:title, :description, :location, :latitude, :longitude, :category, :status, :votes, photos: [])
  end
end

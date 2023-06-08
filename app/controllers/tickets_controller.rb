class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
    @note = Note.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new()
    @ticket.user = current_user
    @ticket.report = Report.find(params[:report_id])
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(report_params)
    redirect_to ticket_path(@ticket)
  end

  # def ticket_params
  #   params.require(:report).permit(:report_id)
  # end
end

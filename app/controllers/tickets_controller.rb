class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = ticket.new(ticket_params)
    if @ticket.save
      redirect_to report_ticket_path
    else
      render :new, status: :unprocessable_entity
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(report_params)
    redirect_to ticket_path(@ticket)
  end

  def ticket_params
    params.require(:report).permit(:user_id, :report_id, :status)
  end
end

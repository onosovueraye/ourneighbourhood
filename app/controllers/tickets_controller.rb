class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
    @note = Note.new
  end

  def new
    @ticket = Ticket.new
  end

  def close_ticket
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.update(status: "Done")
    @ticket.report.update(status: "Done")
    if  @ticket.save!
      redirect_to journal_path(@ticket)
    end
  end

  def create
    @ticket = Ticket.new
    @ticket.user = current_user
    @ticket.report = Report.find(params[:report_id])
    @ticket.report.update(status: "In Progress")
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

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.report.update(status: "Unclaimed")
    @ticket.notes.destroy_all
    @ticket.destroy
    redirect_to report_path
  end

  private

  def ticket_params
    params.require(:report).permit(:report_id)
  end
end

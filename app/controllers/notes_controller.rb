class NotesController < ApplicationController

  def new
    @note = Note.new
    @ticket = Ticket.find(params[:ticket_id])
  end

  def create
    @note = Note.new(note_params)
    @ticket = Ticket.find(params[:ticket_id])
    @note.ticket = @ticket
    @note.user = current_user
    if @note.save
      redirect_to reports_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def note_params
    params.require(:report).permit(:ticket_id, :description)
  end
end

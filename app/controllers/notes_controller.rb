class NotesController < ApplicationController

  def new
    @note = Note.new
    @ticket = Ticket.find(params[:ticket_id])
  end

  def create
    @note = Note.new(note_params)
    @ticket = Ticket.find(params[:ticket_id])
    @note.ticket = @ticket
    if @note.save
      redirect_to ticket_path(@ticket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def note_params
    params.require(:note).permit(:description, photos: [])
  end
end

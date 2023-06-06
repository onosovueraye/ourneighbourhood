class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to reports_path
    else
      render :new, status: :unprocessable_entity
  end

  def note_params
    params.require(:report).permit(:ticket_id, :description)
  end

end

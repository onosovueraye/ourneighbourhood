class UsersController < ApplicationController

  def dashboard
    @tickets = Ticket.where(user: current_user)
    @follows = Follow.where(user: current_user)
    @reports = Report.where(user: current_user)
  end

end

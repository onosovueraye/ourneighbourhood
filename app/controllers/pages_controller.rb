class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def journal
   @reports = Report.where(status: "Done")
  end


end

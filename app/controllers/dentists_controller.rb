class DentistsController < ApplicationController

  def show
    @dentist = Dentist.find(params[:id])
  end

end

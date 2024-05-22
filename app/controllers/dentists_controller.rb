class DentistsController < ApplicationController

  def show
    @dentist = Dentist.find(params[:id])
  end

  def index
    @dentists = Dentist.all
  end

end

class DentistsController < ApplicationController

  def show
    @dentist = Dentist.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def index
    @dentists = Dentist.all
  end

  def edit
    @dentist = Dentist.find( params[:id])
  end

  def new
    @dentist = Dentist.new
  end

  def update
    @dentist = Dentist.find(params[:id])
    if @dentist.update(dentist_post_params)
      redirect_to @dentist
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @dentist = Dentist.new(dentist_post_params)
    if @dentist.save
      redirect_to @dentist
    else
      render :new, status: :unprocessable_entity
    end

  end


  def dentist_post_params
    params.require(:dentist).permit(:name, :registration_status, :registered_since)
  end

end

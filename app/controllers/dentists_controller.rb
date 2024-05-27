class DentistsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_dentist, except: [:index, :new, :create]

  def show
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def index
    @dentists = Dentist.all
  end

  def edit
  end

  def new
    @dentist = Dentist.new
  end

  def update
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

  def destroy
    @dentist.destroy
    redirect_to dentists_path
  end


  def dentist_post_params
    params.require(:dentist).permit(:name, :registration_status, :registered_since)
  end

  def set_dentist
    @dentist = Dentist.find(params[:id])
  end

end

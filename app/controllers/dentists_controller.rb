
class DentistsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_dentist, except: [:index, :new, :create]

  def show
  end

  def index
    @dentists = user_signed_in? ? Dentist.all : Dentist.published
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
    params.require(:dentist).permit(:name, :registration_status, :registered_since, :published_at)
  end

  def set_dentist
    @dentist = user_signed_in? ? Dentist.find(params[:id]) : Dentist.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end



end

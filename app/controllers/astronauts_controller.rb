class AstronautsController < ApplicationController

  before_action :load_astronaut, only: [:show, :edit, :update, :destroy]

  def index
    @astronauts = Astronaut.all
  end


  def show
  end

  def new
    @astronaut = Astronaut.new
  end

  def create
    @astronaut = Astronaut.new(astronaut_params)
    if @astronaut.save
      redirect_to astronauts_path, :notice => "Astronaut was created!"
    else
      flash[:error] = @astronaut.errors.full_messages.join("\n")
      redirect_to new_astronaut_path
    end
  end

  def edit
  end

  def update
    if @astronaut.update(astronaut_params)
      redirect_to astronaut_path(@astronaut), :notice => "Astronaut was updated!"
    else
      render :edit
    end
  end

  def destroy
    if @astronaut.destroy
      redirect_to astronauts_path, :notice => "Astronaut was deleted!"
    end
  end

  private

  def load_astronaut
    @astronaut = Astronaut.find(params[:id])
  end

  def astronaut_params
    params.require(:astronaut).permit(:name, :surname, :description, :gender, :age, :number_of_space_visits)
  end
end
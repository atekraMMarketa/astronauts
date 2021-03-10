class AstronautsController < ApplicationController

  before_action :load_astronaut, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @astronauts = pagy(Astronaut.all, items: 30)
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

  def new_xml_import
  end

  def parse_xml
    xml_file = params[:xml_import][:xml_file_for_import]
    if xml_file.present?
      old_all_astronauts_count = Astronaut.all.count
      # Create parser
      parser = Nokogiri::XML::SAX::Parser.new(XmlParser.new)
      # Send XML to the parser
      parser.parse(File.open(xml_file))
      @new_astronauts_count = Astronaut.all.count - old_all_astronauts_count
      redirect_to astronauts_path, :notice => "Astronauts was successfully imported! Totally was imported #{@new_astronauts_count} records."
    else
      flash[:error] = "You must select some XML file!"
      redirect_to new_xml_import_astronauts_path
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
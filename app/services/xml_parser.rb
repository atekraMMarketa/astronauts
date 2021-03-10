class XmlParser < Nokogiri::XML::SAX::Document

  def start_document
    @values = { name: nil, surname: nil, gender: nil, age: nil, number_of_space_visits: nil }
    @current_el = nil
  end

  def start_element(el_name, attrs = [])
    @current_el = el_name
  end

  def end_element(el_name)
    if el_name == "Astronaut"
      Astronaut.create(name: @values[:name], surname: @values[:surname], gender: @values[:gender], age: @values[:age], number_of_space_visits: @values[:number_of_space_visits])
    else
      @current_el = nil
    end
  end

  def characters(str)
    if @current_el == "name" || @current_el == "surname" || @current_el == "gender" || @current_el == "age" || @current_el == "number_of_space_visits"
      @values[@current_el.to_sym] = str.strip
    end
  end
end

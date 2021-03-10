module ApplicationHelper
  include Pagy::Frontend

  BOOTSTRAP_FLASH_MSG = {
      notice: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-block',
      warning: 'alert-warning'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym)
  end

  def flash_messages_for(options = {})
    "".tap do |result|
      flash.each do |name, msg|
        result << "<div id='errorExplanation' class='alert #{bootstrap_class_for(name)} text-center'>"
        result << "<p>#{msg}</p>"
        result << "</div>"
      end
    end.html_safe
  end
end

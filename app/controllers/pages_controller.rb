class PagesController < ApplicationController
  def index
  end

  def send_feedback
    ApplicationMailer.feedback_email(@current_user,params).deliver_now
    redirect_to root_path, :notice => "Your message was successfully send to me. I will contact you as soon as possible!"
  end
end
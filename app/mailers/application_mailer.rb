class ApplicationMailer < ActionMailer::Base
  default from: 'marketa.glatzova@gmail.com'
  layout 'mailer'

  def feedback_email(user, params)
    @comments = params[:comments]
    if user
      @email = user.email
      @name = user.full_name
    else
      @name = params[:name]
      @email = params[:email]
    end
    mail(to: "marketa.glatzova@gmail.com", subject: "New message from an astronaut page")
  end
end

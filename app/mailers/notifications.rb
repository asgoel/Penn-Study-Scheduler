class Notifications < ActionMailer::Base
  default from: "admin@pennstudyscheduler.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_calendar.subject
  #
  def new_registration(registration)
    @greeting = "Your New Class"
    @registration = registration
    mail to: registration.user.email
  end
end

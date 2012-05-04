class Notifications < ActionMailer::Base
  default from: "admin@pennstudyscheduler.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_calendar.subject
  #
  def new_invitation(invitation)
    @greeting = "You've Been Invited to a Study Session!"
    @invitation = invitation
    mail to: invitation.user.email
  end
end


class ContactsMailer < ApplicationMailer
  include UsersHelper
  add_template_helper UsersHelper

  def notify_student(user, email, name, message)
    @user = user
    @email = email
    @name = name
    @message = message
    mail to: @user.email, subject: "#{full_name @user} : New message from #{@name} <#{@email}>"
  end
end

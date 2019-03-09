class ContactsMailer < ApplicationMailer
  helper :users

  def notify_student(user, name, message)
    @user = user
    @name = name
    @message = message
    mail to: @user.email, subject: "#{full_name @user} : New message from #{name}"
  end
end

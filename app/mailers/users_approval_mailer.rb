class UsersApprovalMailer < ApplicationMailer
  include UsersHelper
  add_template_helper UsersHelper

  def send_approval(user)
    @user = user
    mail to: @user.email, subject: "Profile approved!"
  end
end

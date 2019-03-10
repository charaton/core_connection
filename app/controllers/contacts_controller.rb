class ContactsController < ApplicationController
  before_action :set_profile

  def new
  end

  def create
    ContactsMailer.notify_student(
      @profile.user,
      params[:email],
      params[:name],
      params[:message]
    ).deliver_later

    redirect_to root_url, notice: "Email has been sent to the student."
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end

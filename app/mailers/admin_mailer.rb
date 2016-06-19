class AdminMailer < ApplicationMailer

  # TODO: Check so this one acually works.
  def new_application_mail(user)
    @user = user
    @admins = get_admins
    @admins.each do |admin|
      mail(to: admin.email, subject: "En ny ansökan har kommit in från #{@user.wow_name}!")
    end
  end

  def get_admins
    @admins = User.all
  end

  def error_to_admin(error, message, context)
    @admins = get_admins
    @error = error
    @message = message
    @context = context
    @admins.each do |admin|
      mail(to: admin.email, subject: "Ett fel uppstod i WCMS..")
    end
  end
end

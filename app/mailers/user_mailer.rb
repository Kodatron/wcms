class UserMailer < ApplicationMailer

  def new_user_email(user, admin, password)
    @user = user
    @admin = admin
    @password = password
    mail(to: @user.email, subject: 'En användare har skapats på WCMS.')
  end

  def guild_application_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'WCMS - Tack för din ansökan!')
  end

  def approved_application_email(user, password, reason, admin)
    @user = user
    @password = password
    @reason = reason
    @admin = admin
    mail(to: @user.email, subject: 'WCMS - Din ansökan har blivit godkänd!')
  end

  def declined_application_email(user, reason, admin)
    @user = user
    @reason = reason
    @admin = admin
    mail(to: @user.email, subject: 'WCMS - Din ansökan har blivit nekad.')
  end
end

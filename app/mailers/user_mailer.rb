class UserMailer < ApplicationMailer

  def guild_application_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'WCMS - Tack för din ansökan!')
  end

  def approved_application_email(user, reason, admin)
    @user = user
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

  def create_user_mail(user)
    @user = user
    mail(to: @user.email, subjekt: 'WCMS - Aktiveringsmail')
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end

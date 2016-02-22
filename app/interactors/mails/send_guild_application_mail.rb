module Mails
  class SendGuildApplicationMail
    include Interactor

    def call
      if context[:status] == :declined
        UserMailer.declined_application_email(context[:document], context[:reason], context[:admin]).deliver_now
      else
        UserMailer.approved_application_email(context[:user], context[:password], context[:reason], context[:admin]).deliver_now
      end
    end
  end
end

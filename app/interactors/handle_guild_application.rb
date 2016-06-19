# -*- encoding : utf-8 -*-
class HandleGuildApplication
  include Interactor::Organizer

  organize [
    ChangeStatus,
    GuildApplications::CreateUserFromApplication,
    Mails::SendGuildApplicationMail
  ]

end

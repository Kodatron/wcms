# -*- encoding : utf-8 -*-
class HandleGuildApplication
  include Interactor::Organizer

  organize [
    ChangeStatus,
    GuildApplications::CreateUserAndProfileFromApplication,
    Mails::SendGuildApplicationMail
  ]

end

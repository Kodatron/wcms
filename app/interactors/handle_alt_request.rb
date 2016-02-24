# -*- encoding : utf-8 -*-
class HandleAltRequest
  include Interactor::Organizer

  organize [
    ChangeStatus,
    AltRequests::BuildNewAlt,
    AltRequests::SwitchCharacters,
    AltRequests::DeleteOldAlt
  ]

end

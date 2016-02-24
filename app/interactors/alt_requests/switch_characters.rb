# -*- encoding : utf-8 -*-
module AltRequests
  class SwitchCharacters
    include Interactor

    def call
      if context[:document].approved?
        user = context[:user]
        alt = context[:alt]
        profile = context[:profile]
        user.update_attributes!(name: alt.wow_name)
        profile.update_attributes!(avatar: alt.avatar, wow_region: alt.wow_region, wow_server: alt.wow_server, wow_class: alt.wow_class)
      end
    end

  end
end

# -*- encoding : utf-8 -*-
module AltRequests
  class BuildNewAlt
    include Interactor

    def call
      user = context[:user]
      profile = context[:profile]

      if context[:document].approved?
        new_alt = Alt.new(user_id: user.id, wow_name: user.name, wow_region: profile.wow_region, wow_server: profile.wow_server, wow_class: profile.wow_class, avatar: profile.avatar)
        new_alt.save(validate: false)
        context[:new_alt] = new_alt
      end
    end
  end
end

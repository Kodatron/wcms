# -*- encoding : utf-8 -*-
module GuildApplications
  class CreateUserAndProfileFromApplication
    include Interactor

    def call
      ga = context[:document]
      if context[:status] == :approved
        user = User.new(name: ga.wow_name, email: ga.email)
        user.save!
        profile = Profile.new(user_id: user.id, wow_server: ga.wow_server, wow_region: ga.wow_region, wow_class: ga.wow_class, firstname: ga.firstname, lastname: ga.lastname, phone: ga.phone, avatar: context[:avatar])
        profile.save!
      end
      context[:user] = user
    end
  end
end

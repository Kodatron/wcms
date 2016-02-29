# -*- encoding : utf-8 -*-
module GuildApplications
  class CreateUserAndProfileFromApplication
    include Interactor

    def call
      ga = context[:document]
      context[:password] = SecureRandom.hex(8)
      if context[:status] == :approved
        user = User.new(name: ga.wow_name, email: ga.email, password: context[:password])
        user.save!
        profile = Profile.new(user_id: user.id, wow_server: ga.wow_server, wow_region: ga.wow_region, wow_class: ga.wow_class, firstname: ga.firstname, lastname: ga.lastname, phone: ga.phone, avatar: context[:avatar])
        profile.save!
      end
      context[:user] = user
    end
  end
end

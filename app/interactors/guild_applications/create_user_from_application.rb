# -*- encoding : utf-8 -*-
module GuildApplications
  class CreateUserFromApplication
    include Interactor

    def call
      ga = context[:document]
      if context[:status] == :approved
        user = User.new(firstname: ga.firstname, lastname: ga.lastname, email: ga.email)
        user.save!

        context[:user] = user
        character_params = {
          user_id: user.id,
          name: ga.wow_name,
          wow_region: ga.wow_region,
          wow_server: ga.wow_server,
          wow_class: ga.wow_class,
          wow_spec: ga.wow_spec,
          state: 0
        }

        context[:character] = Character.new(character_params)
        interactor = SetupCharacter.call(character: context[:character])
      end
    end
  end
end

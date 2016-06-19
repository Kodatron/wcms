module Characters
  class GetLevel
    include Interactor

    def call
      context[:character].level = context[:api].get_character_level(context[:character].wow_server, context[:character].name)
      context[:character].save!
    end
  end
end

module Characters
  class GetImages
    include Interactor

    def call
      context[:character].avatar_url = context[:api].get_character_avatar(context[:character].wow_server, context[:character].name)
      context[:character].profile_url = context[:character].avatar_url.sub("avatar", "profile")
    end
  end
end

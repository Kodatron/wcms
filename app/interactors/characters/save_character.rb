module Characters
  class SaveCharacter
    include Interactor

    def call
      context[:character].save!
    end
  end
end

class UpdateCharacters
  include Interactor

  def call
    context[:api] = WowApi.new
    context[:characters] = Character.all.includes(:user)
    context[:characters].each do |char|
      context[:char] = char
      interactor = Characters::GetLevel.call(character: context[:char], api: context[:api])
      unless interactor.success?
        raise interactor.errors.inspect
      end
    end
  end

end

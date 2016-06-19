class UpdateArmory
  include Interactor
  include Interactor::Organizer

  def call
    context[:api] = WowApi.new
    context[:characters] = Character.all.includes(:user)

    context[:characters].each do |char|
      context[:char] = char
      char.gears.update_all(active: 0)
      get_armory = Gears::GetArmoryData.call(
        character: char,
        api: context[:api]
      )
      if get_armory.success?
        create_gear = Gears::CreateUserArmory.call(
          armory_data: get_armory.armory_data,
          character: char,
          api: context[:api]
        )
      else
        raise "Fail".inspect
      end
    end
  end

end

class UpdateArmory
  include Interactor
  include Interactor::Organizer

  def call
    context[:api] = WowApi.new
    context[:users] = User.all.includes(:profile)

    context[:users].each do |user|
      context[:user] = user
      user.gears.update_all(active: 0)
      get_armory = Gears::GetArmoryData.call(
        user: user,
        api: context[:api]
      )
      if get_armory.success?
        create_gear = Gears::CreateUserArmory.call(
          armory_data: get_armory.armory_data,
          user: user,
          api: context[:api]
        )
      else
        raise "Fail".inspect
      end
    end
  end

end

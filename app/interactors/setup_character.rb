class SetupCharacter
  include Interactor
  include Interactor::Organizer

  organize [
    Gears::SetupApiClient,
    Characters::GetImages,
    Characters::GetLevel,
    Gears::GetArmoryData,
    Gears::CreateUserArmory
  ]

end

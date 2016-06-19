module Gears
  class SetupApiClient
    include Interactor

    def call
      context[:api] = WowApi.new
    end
  end
end

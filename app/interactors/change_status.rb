class ChangeStatus
  include Interactor

  def call
    context[:document].update_attributes!(status: context[:status])
  end
end

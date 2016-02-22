class ChangeStatus
  include Interactor::Organizer

  def call
    context[:document].update_attributes(status: context[:status])
  end
end

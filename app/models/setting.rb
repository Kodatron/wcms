class Setting < ActiveRecord::Base
  enum locale: [:sv, :en]

  belongs_to :user
end

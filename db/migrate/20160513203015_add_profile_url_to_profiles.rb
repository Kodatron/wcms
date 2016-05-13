class AddProfileUrlToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_url, :string, default: nil, after: :avatar
  end
end

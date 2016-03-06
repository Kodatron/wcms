class ServersController < ApplicationController
  before_action :init_api
  before_action :check_admin

  def index
    Profile.wow_regions.keys.to_a.each_with_index do |region, index|
      y = @wow.get_realm_status(region)
      y['realms'].each do |r|
        s = Server.new(name: r['name'], wow_region: index, locale: r['locale'])
        s.save!
      end
    end
    flash[:notice] = "Servers successfully imported!"
    redirect_to admin_index_path
  end
end

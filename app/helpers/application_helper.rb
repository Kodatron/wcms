module ApplicationHelper
  
  def load_navbar
    if params[:controller] == 'admin'
      begin
        render :partial => @navbar || "#{params[:controller]}/navbar/navbar.#{params[:action]}"
      rescue ActionView::MissingTemplate
      end
    end
  end

  def search_results_for search, *options
     options = options.extract_options!
     "#{t(:Search_results_for, search: "<strong>#{search}</strong>")} #{link_to t(:Show_all), options.delete(:path)}".html_safe
  end

  def render_thumbnail_url region, avatar
    "http://#{region}.battle.net/static-render/eu/#{avatar}"
  end

  def render_avatar_url region, avatar
    avatar = avatar.sub! 'avatar', 'profile'
    "http://#{region}.battle.net/static-render/eu/#{avatar}"
  end
end

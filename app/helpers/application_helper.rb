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

end

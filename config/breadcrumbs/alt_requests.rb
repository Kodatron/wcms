crumb :alt_requests do
  link t(:Alt_Requests), admin_alt_requests_path
end

crumb :alt_request do |alt|
  user = "s" == alt.user.name.last ? alt.user.name : alt.user.name+"s"
  link "#{user} #{t(:Request)}", "#"
  parent :alt_requests
end

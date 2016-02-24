crumb :users do
  link t(:Users), admin_users_path
end

crumb :user do |user|
  link user.name, user
  parent :users
end

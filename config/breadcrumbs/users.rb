crumb :users do
  link t(:Users), admin_users_path
end

crumb :user_new do
  link t(:New), new_user_path
  parent :users
end
crumb :user_edit do
  link t(:Edit), edit_user_path
  parent :users
end
crumb :user do |user|
  link user.name, user
  parent :users
end

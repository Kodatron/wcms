crumb :news do
  link t(:News), admin_news_path
end

crumb :news_new do
  link t(:New), new_news_path
  parent :news
end

crumb :new do |post|
  link post.title, post
  parent :news
end

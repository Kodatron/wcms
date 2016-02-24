crumb :news do
  link t(:News), admin_news_path
end

crumb :new do |post|
  link post.title, post
  parent :news
end

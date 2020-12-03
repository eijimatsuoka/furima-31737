crumb :root do
  link "商品一覧", root_path
end

crumb :items_new do
  link "商品出品"
  parent :root
end

crumb :items_show do |item|
  link "商品詳細", item_path(item)
  parent :root
end

crumb :items_edit do |item|
  link "商品編集"
  parent :items_show, item
end

crumb :items_purchase do |item|
  link "商品購入"
  parent :items_show, item
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
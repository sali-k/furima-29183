crumb :root do
  link "トップページ", root_path
end

crumb :profile do
  link "プロフィール", user_path(current_user)
  parent :root
end

crumb :profile_edit do
  link "会員情報変更", edit_user_registration_path(user_id:current_user.id)
  parent :profile
end

crumb :item_new do
  link "商品の出品", new_item_path
  parent :root
end

crumb :item do |item|
  link "商品の概要", item_path(item)
  parent :root,item
end

crumb :purchase do |purchase_item|
  link "商品の購入", item_purchases_path(purchase_item)
  parent :item,purchase_item
end

crumb :item_edit do |item|
  link "商品の編集", edit_item_path(item)
  parent :item,item
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
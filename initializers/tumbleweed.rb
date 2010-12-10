Tumbleweed.configure do
  # Remember to restart your server after modifying this file
  # 
  # You define crumbs by calling the "crumb" method, and specifying its name, text, url and parent
  # text can be a string, or a lambda
  # url can be a string, a symbolized route helper (:root_url), or a lambda
  # parent should be specified as the name of the parent crumb
  # If no parent is specified, then root is assumed
  # 
  # You can also change the behavior of other parts of the plugin:
  # To specify a different delimiter (default is &gt;), call: delimiter "new delimiter"
  # By default, we always show a root crumb. You can control this with show_root and dont_show_root
  # By default, last crumb in trail is not linked. You can control this with link_last, and dont_link_last
  # 
  # Examples:
  # crumb :root, 'Home', :root_url
  # crumb :users, 'Users', :users_url
  # crumb :user, lambda { |user| user.name }, lambda { |user| user_path(:id => user.id) }, :users
  # dont_show_root
  # link_last
  # delimiter '&rsaquo;&rsaquo;'
  # 
  # Each crumb will have the CSS class 'breadcrumb'
  # The delimieter will be a span, with the CSS class 'breadcrumb_delimiter'
  # The whole trail will be wrapped in a div with the CSS class 'breadcrumb_trail'
  # 
  # Usage:
  # In your layout (app/views/layouts/application.html.erb) you add: <%= crumb_trail %>
  # In your view you add <% trail :name %> to specify which trail to display
  # If your trail contains a lambda that expects an object, you call it using <% trail :name, object %>
  
  crumb :root, 'Home', :root_url
  
end

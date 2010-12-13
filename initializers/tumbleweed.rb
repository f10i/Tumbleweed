Tumbleweed::Tumbleweed.configure do
  # Remember to restart your server after modifying this file
  # 
  # You define a crumb by giving it a name, and passing it a block.
  # Inside the block you call the method `link`, and specify the link title and URL.
  # Link title can be a string or a lambda that will be evaluated at runtime.
  # Link URL can be a string, a symbolized route helper (e.g: :root_path), or a lambda.
  # Optionally, you can also specify a parent crumb. If not specified, root is assumed.
  # You can pass a parameter to the block, and use it to dynamically modify the link title and/or URL.
  # A crumb can pass a parameter to its parent crumb.
  # 
  # You can also change the behavior of other parts of the plugin:
  # Default delimiter between crumbs is &gt;. You can change it using: delimiter 'new delimiter'
  # By default, we always show a root crumb. You can control this with show_root and dont_show_root
  # By default, last crumb in trail is not linked. You can control this with link_last, and dont_link_last
  # 
  # In your layout (app/views/layouts/application.html.erb) you add: <%= crumb_trail %>
  # In your view you add <% trail :name %> to specify which trail to display
  # If your crumb block expects an object, you call it using <% trail :name, object %>
  # 
  # Each crumb will have the CSS class 'breadcrumb'
  # The delimieter will be a span, with the CSS class 'breadcrumb_delimiter'
  # The whole trail will be wrapped in a div with the CSS class 'breadcrumb_trail'
  # 
  # Example:
  # 
  # crumb :all_users do
  #   link 'Users', :users_path
  # end
  # 
  # crumb :user_profile do |user|
  #   link user.username, lambda { user_path(:id => user.id) }
  #   parent :all_users
  # end
  # 
  # crumb :user_image do |image|
  #   link image.title, lambda { user_image_path(:id => image.id, :user_id => image.user.id) }
  #   parent :user_profile, image.user
  # end
  # 
  # dont_show_root
  # link_last
  # delimiter '&rsaquo;&rsaquo;'
  # 
  # In app/views/layout/application.html.erb
  # <%= crumb_trail %>
  # 
  # In app/views/users/index.html.erb
  # <% trail :all_users %>
  # 
  # In app/views/users/show.html.erb
  # <% trail :user_profile, @user %>
  
  crumb :root do
    link 'Home', :root_url
  end
  
end

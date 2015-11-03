gem "devise"

#if yes? "Do you want bootstrap"
  gem "twitter-bootstrap-rails"
  gem "bootstrap_form"
#end

gem "slim-rails"

gem_group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry-rails"
  gem "quiet_assets"
end

after_bundle do
  generate "bootstrap:install", "static"
  generate "bootstrap:layout"

  generate "devise:install"
  generate "devise", "User"

  rake "db:migrate"

  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end

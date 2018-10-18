set :stage, :production
set :rails_env, 'production'
set :branch, 'capistrano'
server fetch(:website_url), user: fetch(:deploy_user), roles: %w[web app db]

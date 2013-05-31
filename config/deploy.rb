server "pro-008.openminds.be", :app, :web, :db, primary: true

set :user, 'arrrrcamp4'
set :application, "brug"
set :repository,  "git@github.com:arrrrcamp/brug.git"
set :branch,      "master"

set :configs, %w[database]

after 'deploy:create_symlink', 'deploy:link_dot_env'

namespace :deploy do
  desc 'symlinks dot_env config file'
  task :link_dot_env do
    run "ln -nfs #{shared_path}/config/dot_env #{release_path}/.env"
  end
end

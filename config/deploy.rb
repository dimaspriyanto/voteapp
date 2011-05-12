set :application, "eg-sid"
set :repository,  "git@eg-sid.unfuddle.com:eg-sid/egsid.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/egsid/rails_apps/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "www.eg-sid.com"
role :web, "www.eg-sid.com"
#role :db,  "your db-server here", :primary => true
role :db, "www.eg-sid.com", :primary => true
set :user, "egsid"
set :use_sudo, false

deploy.task :db_symlink, :roles => :app do
  run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
end

deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end

after 'deploy', 'deploy:cleanup', 'deploy:db_symlink'


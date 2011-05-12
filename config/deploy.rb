set :application, "voteapp"
set :repository, 'git@github.com:dimaspriyanto/voteapp.git'
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

deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end

after 'deploy', 'deploy:cleanup', 'deploy:db_symlink'


require "bundler/capistrano"

set :application, "mucke-traeumt-gerade"
set :bundle_flags, "--deployment"

set :scm, :git
set :scm_verbose, true
set :repository, "git@github.com:tnitsche/mucke-traeumt-gerade.git"

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }
set :use_sudo,        false


role :web, "mucke.traeumtgerade.de"                          # Your HTTP server, Apache/etc
role :app, "mucke.traeumtgerade.de"                          # This may be the same as your `Web` server
role :db,  "mucke.traeumtgerade.de", :primary => true # This is where Rails migrations will run
role :db,  "mucke.traeumtgerade.de"
set :deploy_to, "/var/www/roots/#{application}/"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

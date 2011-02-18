#set :output, '/home/thiagomagro/ProjetosRuby/Pessoal/aliments/log/cron.log'
#job_type :rake,    "cd :path && RAILS_ENV=:environment rake :task :output"

every 1.minute do
  rake "thinking_sphinx:index"
end

every :reboot do
  command "pkill searchd"
  rake "thinking_sphinx:index"
  rake "thinking_sphinx:start"
end


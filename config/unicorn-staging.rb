root = "/home/deployer/apps/crossway-staging/current"
working_directory root
pid "#{root}/tmp/pids/unicorn-staging.pid"
stderr_path "#{root}/log/unicorn-staging.log"
stdout_path "#{root}/log/unicorn-staging.log"

listen "/tmp/unicorn.crossway-staging.sock", :backlog => 64
listen 8080, :tcp_nopush => true
worker_processes 2
timeout 30
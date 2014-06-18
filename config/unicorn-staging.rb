root = "/home/deployer/apps/crossway-staging/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn-staging.log"
stdout_path "#{root}/log/unicorn-staging.log"

listen "/tmp/unicorn.crossway.sock"
worker_processes 2
timeout 30
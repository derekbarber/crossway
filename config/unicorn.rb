root = "/home/deployer/apps/crossway/current"
working_directory root
pid "/home/deployer/apps/crossway/current/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.crossway.sock"
worker_processes 2
timeout 30
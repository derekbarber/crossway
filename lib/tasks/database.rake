namespace :db do 

  task :bootstrap => ["db:drop", "db:create", "db:migrate", "db:load" ]

  task :load do
    `pg_restore --verbose -h localhost -d crossway_development db/dumps/development.dump`
  end

  task :dump do
    `pg_dump -Fc --no-acl --no-owner crossway_development > db/dumps/development.dump`
  end
end
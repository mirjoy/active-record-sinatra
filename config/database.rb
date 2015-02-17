# set the database based on the current environment
database_name = "task-manager-#{TaskManager.environment}"
db = URI.parse(ENV['DATABASE_URL'] || "sqlite3://localhost/db/#{database_name}")

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme,
  :database => "db/#{database_name}",
)

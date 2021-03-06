require 'active_record'
require 'pg'
require 'yaml'

# This is some boilerplate code to read the config/database.yml file
# And connect to the database
config_path = File.join(File.dirname(__FILE__), "../db/config.yml")
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.establish_connection(:development)

# Set a logger so that you can view the SQL actually performed by ActiveRecord
logger = Logger.new(STDOUT)
logger.formatter = proc do |severity, datetime, progname, msg|
   "#{msg}\n"
end
ActiveRecord::Base.logger = logger

# Load all models!
Dir["#{__dir__}/../app/models/*.rb"].each {|file| require file }

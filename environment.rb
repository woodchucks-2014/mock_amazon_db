# Load the necessary files for the application

ROOT_DIR = File.expand_path('../', __FILE__)

DB_FILE = File.join(ROOT_DIR, 'amazon.db')

require File.join(ROOT_DIR, 'model')

Dir[ File.join(ROOT_DIR, 'models', '*.rb')].each do |model|
  require model
end

Model.establish_connection

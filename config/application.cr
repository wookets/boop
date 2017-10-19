require "./initializers/**"
require "amber"
require "../src/models/**"

# load the application_controller before controllers which depend on it
require "../src/controllers/application_controller"
require "../src/controllers/**"

# NOTE: Settings should all be in config/environments/env.yml.
# Anything here will overwrite all environments.
Amber::Server.configure do |setting|
  # Server options
  # setting.name = "Boop web application."
  # setting.port = 80 # Port you wish your app to run
  # setting.log = ::Logger.new(STDOUT)
  # setting.log.level = ::Logger::INFO
end

# Error Controller
# Ensure Amber::Pipe::Error.new is inside config/router.cr pipelines
# Put error templates inside src/views/error/
class Amber::Controller::Error < Amber::Controller::Base
  LAYOUT = "application.ecr"

  # def forbidden
  #   render("403.ecr")
  # end

  # def not_found
  #   render("404.ecr")
  # end

  # def internal_server_error
  #   render("500.ecr")
  # end
end

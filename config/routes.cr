require "../src/middleware/*"

Amber::Server.configure do |app|
  pipeline :web do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new
    plug Authenticate.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::Error.new
    plug HTTP::StaticFileHandler.new("./public")
    plug HTTP::CompressHandler.new
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end

  routes :web do
    
    
    get "/", HomeController, :index

    # accounts
    get "/create-account", AccountsController, :new
    post "/create-account", AccountsController, :create
    get "/edit-account", AccountsController, :edit
    post "/edit-account", AccountsController, :update
    get "/dashboard", AccountsController, :dashboard
    get "/profile", AccountsController, :profile

    #sessions
    get "/login", SessionsController, :new
    post "/login", SessionsController, :create
    get "/logout", SessionsController, :delete

    # guides
    get "/music-guide", GuidesController, :index

    # threads
    get "/threads/join", SongThreadRequestsController, :new
  end
end

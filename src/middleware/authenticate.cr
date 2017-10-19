class HTTP::Server::Context
  property current_account : Account?
  property is_public_path : Bool?
end

class Authenticate < Amber::Pipe::Base
  UNRESTRICTED_ROUTES = [
    "/",
    "/login",
    "/create-account"
  ]

  def call(context)
    context.is_public_path = UNRESTRICTED_ROUTES.includes?(context.request.path)

    account_id = context.session["account_id"]?

    unless account_id
      return validate_context_path(context)
    end

    if account = Account.find(account_id.to_s)
      context.current_account = account
      call_next(context)
    else
      validate_context_path(context)
    end
  end

  private def validate_context_path(context)
    if context.is_public_path
      return call_next(context)
    end

    context.flash["warning"] = "Please log in to your account."
    context.response.headers.add "Location", "/login"
    context.response.status_code = 302
  end
end
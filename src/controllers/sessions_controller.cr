class SessionsController < ApplicationController
  before_action do
    only [:new, :create] do
      if context.current_account
        redirect_to location: "/dashboard"
      end
    end
  end
  
  def new
    render "new.ecr", layout: "global.ecr"
  end

  def create
    account_params = params.to_h.select("username", "password")
    account = Account.find_by(:username, account_params["username"])

    if account && account.authenticate(account_params["password"])
      session["account_id"] = account.id.to_s
      redirect_to controller: :accounts, action: :dashboard
    else
      redirect_to location: "/login", flash: { "warning" => "Unable to log in with that username & password." }
    end
  end

  def delete
    session.destroy
    redirect_to "/"
  end
end

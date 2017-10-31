class AccountsController < ApplicationController
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

    unless Account.unique?(account_params["username"])
      return redirect_to controller: :accounts, action: :new, flash: { "warning" => "That username is already taken." }
    end

    account = Account.new
    account.username = account_params["username"]
    account.password = account_params["password"]
    account.save

    redirect_to location: "/login", flash: { "success" => "Your account has been created! Please log in."}
  end

  def edit
    render "edit.ecr", layout: "admin.ecr"
  end

  def update
  end

  def dashboard
    threads = context.current_account.as(Account).song_threads
    render "dashboard.ecr", layout: "admin.ecr"
  end

  def profile
    render "profile.ecr", layout: "admin.ecr"
  end
end

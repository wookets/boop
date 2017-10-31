class HomeController < ApplicationController
  def index
    render "index.ecr", layout: "global.ecr"
  end
end


class HomeController < ApplicationController
  def index
    render "index.ecr", layout: "public.ecr"
  end
end


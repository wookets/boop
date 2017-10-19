class GuidesController < ApplicationController
  def index
    render "index.ecr", layout: "admin.ecr"
  end
end

class SongThreadRequestsController < ApplicationController
  def new
    if context.session["song_thread_request_id"]
      request = SongThreadRequest.find context.session["song_thread_request_id"]
    else
      request = SongThreadRequest.new
      request.save
      context.session["song_thread_request_id"] = request.id
    end

    render "new.ecr"
  end
end

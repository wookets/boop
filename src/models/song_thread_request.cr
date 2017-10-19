require "granite_orm/adapter/pg"

class SongThreadRequest < Granite::ORM::Base
  adapter pg
  table_name "song_thread_requests" # TODO https://github.com/amberframework/granite-orm/issues/76
  belongs_to :account
  timestamps
end

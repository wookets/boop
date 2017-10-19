require "granite_orm/adapter/pg"

class SongThread < Granite::ORM::Base
  adapter pg
  table_name song_threads # TODO https://github.com/amberframework/granite-orm/issues/76

  field bpm : Int32
  field actions_per_turn : Int32
  field title : String
  field primary_account_id : Int32
  field secondary_account_id : Int32

  timestamps

  def primary_account
    Account.find @primary_account_id
  end

  def primary_account=(account : Account)
    @primary_account_id = account.id
  end

  def secondary_account
    Account.find @secondary_account_id
  end

  def secondary_account=(account : Account)
    @secondary_account_id = accound.id
  end
end

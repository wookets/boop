require "granite_orm/adapter/pg"
require "crypto/bcrypt/password"

class Account < Granite::ORM::Base
  adapter pg

  field username : String
  field encrypted_password : String

  timestamps

  def song_threads
    SongThread.all "WHERE primary_account_id = ? OR secondary_account_id = ?", [id, id]
  end

  def password=(password : String)
    @encrypted_password = Crypto::Bcrypt::Password.create(password, cost: 11).to_s
  end

  def authenticate(password : String)
    if (enc = @encrypted_password)
      return Crypto::Bcrypt::Password.new(enc) == password
    else
      return false
    end
  end

  def self.unique?(username : String)
    return find_by(:username, username).nil?
  end
end

class User < ApplicationRecord
  has_secure_password
  has_many :crafts

  def token
    secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base[0]
    payload = {user_id: self.id}
    JWT.encode(payload, secret)
  end

end

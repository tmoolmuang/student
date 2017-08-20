class User < ApplicationRecord
	require "bcrypt"
	before_create :generate_api_token

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

	private
  def generate_api_token
    self.api_token = SecureRandom.urlsafe_base64
    generate_api_token if User.exists?(api_token: self.api_token)
  end
end

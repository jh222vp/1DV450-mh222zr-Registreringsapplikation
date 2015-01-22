class User < ActiveRecord::Base
	has_secure_password

	# Downcase email before saving
	before_save { self.email = email.downcase }

	# Regex for email
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, format: { with: EMAIL_REGEX },
										uniqueness: true, length: { minimum: 6 }
	validates :password, length: { minimum: 6 }

	has_one :key
end

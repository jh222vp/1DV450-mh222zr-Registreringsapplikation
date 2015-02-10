class Key < ActiveRecord::Base
	belongs_to :user
	before_create :generate_access_token

	private

	def generate_access_token
		begin
			self.key = SecureRandom.hex(18)
		end while self.class.exists?(key: key)
	end
end

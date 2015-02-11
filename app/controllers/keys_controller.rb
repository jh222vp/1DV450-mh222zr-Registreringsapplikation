class KeysController < ApplicationController
	include SessionsHelper
	before_action :check_user

	def show
		if is_admin?
			# If admin show your key and every users keys
			@key = @current_user.key
			@users = User.includes(:key).all
		else
			@key = @current_user.key
		end
	end
end

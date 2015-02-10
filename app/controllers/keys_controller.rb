class KeysController < ApplicationController
	include SessionsHelper
	before_action :check_user

	def show
		@key = @current_user.key
	end
end

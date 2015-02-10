class SessionsController < ApplicationController
	def new
		if is_logged_in?
			redirect_to key_path
		end
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to key_path
		else
			flash.now[:danger] = "Wrong username and/or password"
			render 'new'
		end
	end

	def destroy
		log_out
		flash[:info] = "You have been logged out"
		redirect_to root_path
	end
end

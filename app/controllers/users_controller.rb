class UsersController < ApplicationController
	before_action :check_user, only: [:destroy]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		key = Key.new
		@user.key = key

		if @user.save
			log_in @user
			redirect_to key_path
		else
			render "new"
		end
	end

	def destroy
		user = User.find_by_id(session[:user_id]).destroy
		log_out
		flash[:warning] = "Your account and API-key has been deleted."
		redirect_to root_path
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end

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
		if is_admin?
			User.find_by_id(params[:format]).destroy
			flash[:warning] = "This account and API-key has been deleted."
			redirect_to key_path
		else
			user = User.find_by_id(session[:user_id]).destroy
			log_out
			flash[:warning] = "Your account and API-key has been deleted."
			redirect_to root_path
		end
	end

	def user_params
		if User.any?
			params.require(:user).permit(:email, :password, :password_confirmation)
		else
			# If there are no users make the user an admin
			params.require(:user).permit(:email, :password, :password_confirmation).merge(admin: true)
		end
	end
end

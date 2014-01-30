class UsersController < ApplicationController

	def index

	end

	def edit
		if !current_user
			logger.info "No current user - redirecting to root path!"
			redirect_to root_path
		end
	end

	def update

		if !current_user
			logger.info "No current user - redirecting to root path!"
			redirect_to root_path
		else
			logger.info "current_user.save!"
			current_user.save!
		end
	end

end

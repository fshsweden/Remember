class UsersController < ApplicationController
	def edit
		if !current_user
			redirect_to root_path
		end
	end

	def update
		if !current_user
			redirect_to root_path
		else
			current_user.save!
		end
	end
end

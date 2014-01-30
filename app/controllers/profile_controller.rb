class ProfileController < ApplicationController
  def index
    if !current_user
		logger.info "No current user - redirecting to root path!"
      redirect_to root_path
    end
  end
end

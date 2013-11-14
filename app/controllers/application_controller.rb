class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :select_layout

  def after_sign_in_path_for(resource_or_scope)
    #request.referrer
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    #request.referrer
    root_path
  end

  private

  def select_layout
	  # @current_user.special? ? "special" : "products"

		logger.info ">>>> SELECTING LAYOUT FROM CONTROLLER:" + params[:controller]
		# return template name depending on circumstances

		if params[:controller] == "devise/sessions"
			"devise_layout"
		else
			"application"
		end

  end

end

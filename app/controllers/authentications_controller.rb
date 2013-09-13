class AuthenticationsController < ApplicationController

  def index
    @authentications = Authentication.all
  end

  def home

  end

  def twitter
    omni = request.env["omniauth.auth"]
    logger.info request.env["omniauth.auth"].to_xml
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret

      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      user = User.new
      user.apply_omniauth(omni)

      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
    end

    session[:omniauth] = omni.except('extra')

  end

  def facebook

    logger.info "--------------------------------------------------------------------------------------"
    hash = request.env["omniauth.auth"].info
    hash.each do |key, value|
      logger.info "#{key} = #{value}"
    end
    logger.info "--------------------------------------------------------------------------------------"
    logger.info "--------------------------------------------------------------------------------------"
    hash = request.env["omniauth.auth"].extra.raw_info
    hash.each do |key, value|
      logger.info "#{key} = #{value}"
    end
    logger.info "--------------------------------------------------------------------------------------"

    omni = request.env["omniauth.auth"]

    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret

      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      user = User.new

      #user.email = omni['info']['email']
      user.email = omni.extra.raw_info.email
      #user.email = omni['extra']['raw_info']['email']

      user.apply_omniauth(omni)

      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
    end

    session[:omniauth] = omni.except('extra')

  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end

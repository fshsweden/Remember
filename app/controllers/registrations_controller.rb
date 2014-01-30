class RegistrationsController < Devise::RegistrationsController

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end
  
  def build_resource(*args)
      super
      if session[:omniauth]
        @user.add_authentications_record(session[:omniauth])
        @user.valid?
      end
  end
    
end

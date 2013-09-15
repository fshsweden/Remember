class WelcomeController < ApplicationController

  def index
    logger.info "WELCOME # INDEX"


    #if current_user
    #  auth = current_user.authentications.find_by_provider('facebook')
    #  if auth
    #    me = FbGraph::User.me(auth.token)
    #    me.feed!(
    #        :message => 'Test update via FbGraph',
    #    )
    #  else
    #    logger.error "User with id=" + current_user.id.to_s + " not found"
    #  end
    #end

  end

  def show
    logger.info "WELCOME # SHOW"
  end

end

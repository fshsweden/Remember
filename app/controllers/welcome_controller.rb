class WelcomeController < ApplicationController

  def index
    logger.info "WELCOME # INDEX"

    @people_with_activity   = Click.where("count > 0").order(:count).reverse
    @people_created_lately  = Person.limit(5).order("created_at DESC")
    @people_updated_lately  = Person.limit(5).order("updated_at DESC")

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

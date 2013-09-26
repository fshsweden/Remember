class FacebookController < ApplicationController
  def index

  end

  def send_hello

    auth = current_user.authentications.find_by_provider('facebook')
    if auth
      me = FbGraph::User.me(auth.token)
      me.feed!(
          :message => 'bought a gift for his mother',
          :picture => 'https://graph.facebook.com/fshsweden/picture',
          :link => 'http://whispering-gorge-8175.herokuapp.com/',
          :name => 'Forget me not',
          :description => 'A place to remember your loved ones'
      )
    end
  end

  def show_fb_friends
    @friends = []
    auth = current_user.authentications.find_by_provider('facebook')
    if auth
      #@friends = FbGraph::User.me(auth.token).friends.map {|f| f.name}.sort
      me = FbGraph::User.me(auth.token)
      @fr = me.friends

      @fr.each do |fr|
        logger.info "User.new"
        user = FbGraph::User.new(fr.identifier, :access_token => auth.token)
        logger.info "User.fetch"
        user = user.fetch
        logger.info user.email
        @friends << user
      end

    else
      @friends << "You have no friends.... :-("
    end
  end

end

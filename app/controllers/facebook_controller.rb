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

end

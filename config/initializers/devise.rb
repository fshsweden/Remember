# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class with default "from" parameter.
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  # Configure the class responsible to send e-mails.
  # config.mailer = "Devise::Mailer"

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  # Configure which keys are used when authenticating a user. The default is
  # just :email. You can configure it to use [:username, :subdomain], so for
  # authenticating a user, both parameters are required. Remember that those
  # parameters are used only when authenticating and not when retrieving from
  # session. If you need permissions, you should implement that in a before filter.
  # You can also supply a hash where the value is a boolean determining whether
  # or not authentication should be aborted when the value is not present.
  # config.authentication_keys = [ :email ]

  # Configure parameters from the request object used for authentication. Each entry
  # given should be a request method and it will automatically be passed to the
  # find_for_authentication method and considered in your model lookup. For instance,
  # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
  # The same considerations mentioned for authentication_keys also apply to request_keys.
  # config.request_keys = []

  # Configure which authentication keys should be case-insensitive.
  # These keys will be downcased upon creating or modifying a user and when used
  # to authenticate or find a user. Default is :email.
  config.case_insensitive_keys = [ :email ]

  # Configure which authentication keys should have whitespace stripped.
  # These keys will have whitespace before and after removed upon creating or
  # modifying a user and when used to authenticate or find a user. Default is :email.
  config.strip_whitespace_keys = [ :email ]

  # Tell if authentication through request.params is enabled. True by default.
  # It can be set to an array that will enable params authentication only for the
  # given strategies, for example, `config.params_authenticatable = [:database]` will
  # enable it only for database (email + password) authentication.
  # config.params_authenticatable = true

  # Tell if authentication through HTTP Basic Auth is enabled. False by default.
  # It can be set to an array that will enable http authentication only for the
  # given strategies, for example, `config.http_authenticatable = [:token]` will
  # enable it only for token authentication.
  # config.http_authenticatable = false

  # If http headers should be returned for AJAX requests. True by default.
  # config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication. "Application" by default.
  # config.http_authentication_realm = "Application"

  # It will change confirmation, password recovery and other workflows
  # to behave the same regardless if the e-mail provided was right or wrong.
  # Does not affect registerable.
  # config.paranoid = true

  # By default Devise will store the user in session. You can skip storage for
  # :http_auth and :token_auth by adding those symbols to the array below.
  # Notice that if you are skipping storage for all authentication paths, you
  # may want to disable generating routes to Devise's sessions controller by
  # passing :skip => :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

  # ==> Configuration for :database_authenticatable
  # For bcrypt, this is the cost for hashing the password and defaults to 10. If
  # using other encryptors, it sets how many times you want the password re-encrypted.
  #
  # Limiting the stretches to just one in testing will increase the performance of
  # your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use
  # a value less than 10 in other environments.
  config.stretches = Rails.env.test? ? 1 : 10

  # Setup a pepper to generate the encrypted password.
  # config.pepper = "b3596c232c25ac48905fe044a1788a5bd223419bd91a87c9ce24904fb3770bcac836b7845faf7ad5c1ee38cd0dac0c522e16effd179ec18e3cc9382c8f58b0d1"

  # ==> Configuration for :confirmable
  # A period that the user is allowed to access the website even without
  # confirming his account. For instance, if set to 2.days, the user will be
  # able to access the website for two days without confirming his account,
  # access will be blocked just in the third day. Default is 0.days, meaning
  # the user cannot access the website without confirming his account.
  # config.allow_unconfirmed_access_for = 2.days

  # A period that the user is allowed to confirm their account before their
  # token becomes invalid. For example, if set to 3.days, the user can confirm
  # their account within 3 days after the mail was sent, but on the fourth day
  # their account can't be confirmed with the token any more.
  # Default is nil, meaning there is no restriction on how long a user can take
  # before confirming their account.
  # config.confirm_within = 3.days

  # If true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied. Requires additional unconfirmed_email
  # db field (see migrations). Until confirmed new email is stored in
  # unconfirmed email column, and copied to email column on successful confirmation.
  config.reconfirmable = true

  # Defines which key will be used when confirming an account
  # config.confirmation_keys = [ :email ]

  # ==> Configuration for :rememberable
  # The time the user will be remembered without asking for credentials again.
  # config.remember_for = 2.weeks

  # If true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # Options to be passed to the created cookie. For instance, you can set
  # :secure => true in order to force SSL only cookies.
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  # Range for password length. Default is 8..128.
  config.password_length = 8..128

  # Email regex used to validate email formats. It simply asserts that
  # an one (and only one) @ exists in the given string. This is mainly
  # to give user feedback and not to assert the e-mail validity.
  # config.email_regexp = /\A[^@]+@[^@]+\z/

  # ==> Configuration for :timeoutable
  # The time you want to timeout the user session without activity. After this
  # time the user will be asked for credentials again. Default is 30 minutes.
  # config.timeout_in = 30.minutes

  # If true, expires auth token on session timeout.
  # config.expire_auth_token_on_timeout = false

  # ==> Configuration for :lockable
  # Defines which strategy will be used to lock an account.
  # :failed_attempts = Locks an account after a number of failed attempts to sign in.
  # :none            = No lock strategy. You should handle locking by yourself.
  # config.lock_strategy = :failed_attempts

  # Defines which key will be used when locking and unlocking an account
  # config.unlock_keys = [ :email ]

  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  # config.maximum_attempts = 20

  # Time interval to unlock the account if :time is enabled as unlock_strategy.
  # config.unlock_in = 1.hour

  # ==> Configuration for :recoverable
  #
  # Defines which key will be used when recovering the password for an account
  # config.reset_password_keys = [ :email ]

  # Time interval you can reset your password with a reset password key.
  # Don't put a too small interval or your users won't have the time to
  # change their passwords.
  config.reset_password_within = 6.hours

  # ==> Configuration for :encryptable
  # Allow you to use another encryption algorithm besides bcrypt (default). You can use
  # :sha1, :sha512 or encryptors from others authentication tools as :clearance_sha1,
  # :authlogic_sha512 (then you should set stretches above to 20 for default behavior)
  # and :restful_authentication_sha1 (then you should set stretches to 10, and copy
  # REST_AUTH_SITE_KEY to pepper)
  # config.encryptor = :sha512

  # ==> Configuration for :token_authenticatable
  # Defines name of the authentication token params key
  # config.token_authentication_key = :auth_token

  # ==> Scopes configuration
  # Turn scoped views on. Before rendering "sessions/new", it will first check for
  # "users/sessions/new". It's turned off by default because it's slower if you
  # are using only default views.
  # config.scoped_views = false

  # Configure the default scope given to Warden. By default it's the first
  # devise role declared in your routes (usually :user).
  # config.default_scope = :user

  # Set this configuration to false if you want /users/sign_out to sign out
  # only the current scope. By default, Devise signs out all scopes.
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # Lists the formats that should be treated as navigational. Formats like
  # :html, should redirect to the sign in page when the user does not have
  # access, but formats like :xml or :json, should return 401.
  #
  # If you have any extra navigational formats, like :iphone or :mobile, you
  # should add them to the navigational formats lists.
  #
  # The "*/*" below is required to match Internet Explorer requests.
  # config.navigational_formats = ["*/*", :html]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', :scope => 'user,public_repo'

  #
  # scopes
  # EMAIL PERMISSIONS
  #    email
  # EXTENDED PERMISSIONS
  #   read_friendlists	Provides access to any friend lists the user created. All user's friends are provided as part of basic data, this extended permission grants access to the lists of friends a user has created, and should only be requested if your application utilizes lists of friends.
  #   read_insights	Provides read access to the Insights data for pages, applications, and domains the user owns.
  #   read_mailbox	Provides the ability to read from a user's Facebook Inbox.
  #   read_stream	Provides access to all the posts in the user's News Feed and enables your application to perform searches against the user's News Feed
  #   xmpp_login	Provides applications that integrate with Facebook Chat the ability to log in users.
  #   user_online_presence	Provides access to the user's online/offline presence
  #   friends_online_presence	Provides access to the user's friend's online/offline presence

  # ads_management	Provides the ability to manage ads and call the Facebook Ads API on behalf of a user.
  # create_event	Enables your application to create and modify events on the user's behalf
  # manage_friendlists	Enables your app to create and edit the user's friend lists.
  # manage_notifications	Enables your app to read notifications and mark them as read. Intended usage:
  #   This permission should be used to let users read and act on their notifications; it should not be used
  #   to for the purposes of modeling user behavior or data mining. Apps that misuse this permission may be
  #   banned from requesting it.
  # publish_actions	Enables your app to post content, comments and likes to a user's stream and requires
  #   extra permissions from a person using your app. Because this permission lets you publish on behalf of
  #   a user please read the Platform Policies to ensure you understand how to properly use this permission.
  #   Note, you do not need to request the publish_actions permission in order to use the Feed Dialog, the
  #   Requests Dialog or the Send Dialog. Facebook used to have a permission called publish_stream, publish_actions
  #   replaces it in most cases, for users. For pages, publish_stream is still required to publish to a page's timeline.
  # publish_stream	The publish_stream permission is required to post to a Facebook Page's timeline. For a Facebook
  #   User use publish_actions.
  # rsvp_event	Enables your application to RSVP to events on the user's behalf
  #
  # EXTENDED PROFILE
  #   User permission           Friends permission	      Description
  #   user_about_me	            friends_about_me	        Provides access to the "About Me" section of the profile in the about property
  #   user_activities	          friends_activities	      Provides access to the user's list of activities as the activities connection
  #   user_birthday	            friends_birthday	        Provides access to the birthday with year as the birthday property. Note that your app may determine if a user is "old enough" to use an app by obtaining the age_range public profile property
  #   user_checkins	            friends_checkins	        Provides read access to the authorized user's check-ins or a friend's check-ins that the user can see. This permission is superseded by user_status for new applications as of March, 2012.
  #   user_education_history	  friends_education_history	Provides access to education history as the education property
  #   user_events	              friends_events	          Provides access to the list of events the user is attending as the events connection
  #   user_groups	              friends_groups	          Provides access to the list of groups the user is a member of as the groups connection
  #   user_hometown	            friends_hometown	        Provides access to the user's hometown in the hometown property
  #   user_interests	          friends_interests	        Provides access to the user's list of interests as the interests connection
  #   user_likes	              friends_likes	            Provides access to the list of all of the pages the user has liked as the likes connection
  #   user_location	            friends_location	        Provides access to the user's current city as the location property
  #   user_notes	              friends_notes	            Provides access to the user's notes as the notes connection
  #   user_photos	              friends_photos	          Provides access to the photos the user has uploaded, and photos the user has been tagged in
  #   user_questions	          friends_questions	        Provides access to the questions the user or friend has asked
  #   user_relationships	      friends_relationships     Provides access to the user's family and personal relationships and relationship status
  #   user_relationship_details	friends_relationship_details	Provides access to the user's relationship preferences
  #   user_religion_politics	  friends_religion_politics	Provides access to the user's religious and political affiliations
  #   user_status	              friends_status	          Provides access to the user's status messages and checkins. Please see the documentation for the location_post table for information on how this permission may affect retrieval of information about the locations associated with posts.
  #   user_subscriptions	      friends_subscriptions	    Provides access to the user's subscribers and subscribees
  #   user_videos	              friends_videos	          Provides access to the videos the user has uploaded, and videos the user has been tagged in
  #   user_website	            friends_website	          Provides access to the user's web site URL
  #   user_work_history         friends_work_history	    Provides access to work history as the work property
  #
  # OPEN GRAPH PROPERTIES
  #
  # User Permission	Friends Permission	Description
  #   publish_actions	              N/A	Allows your app to publish to the Open Graph using Built-in Actions, Achievements, Scores, or Custom Actions. Your app can also publish other activity which is detailed in the Publishing Permissions doc.
  #   user_actions.music  	        friends_actions.music	Allows you to retrieve the actions published by all applications using the built-in music.listens action.
  #   user_actions.news	            friends_actions.news	Allows you to retrieve the actions published by all applications using the built-in news.reads action.
  #   user_actions.video	          friends_actions.video	Allows you to retrieve the actions published by all applications using the built-in video.watches action.
  #   user_actions:APP_NAMESPACE
  #   friends_actions:APP_NAMESPACE Allows you retrieve the actions published by another application as specified by the app namespace. For example, to request the ability to retrieve the actions published by an app which has the namespace awesomeapp, prompt the user for the user_actions:awesomeapp and/or friends_actions:awesomeapp permissions.
  #   user_games_activity	          friends_games_activity	Allows you post and retrieve game achievement activity.

  # PAGE PERMISSIONS
  # manage_pages                    Enables your application to retrieve access_tokens for Pages and Applications that the user administrates. The access tokens can be queried by calling /<user_id>/accounts via the Graph API.
  # See here for generating long-lived Page access tokens that do not expire after 60 days.

  # PUBLIC PROFILE AND FRIENDS LIST
  Public Profile and Friend List

  # When a user logs into your app and you request no additional permissions, the app will have access to only the user's public profile and also their friend list. Public profile refers to the following properties by default:

  # id
  # name
  # first_name
  # last_name
  # link
  # username
  # gender
  # locale
  # age_range
  # Other public information

  if Rails.env.development?
    # DEV versions of API keys
    config.omniauth :twitter, "DGEVy4Z0WMm1qfsJPs5TQ", "PBY3HUtppttMsGEIJWjXeksQQeLybOACzlwzpUaUU"
    config.omniauth :facebook, '430836557026587', 'f8171469fe0860f32207002a00b90465', {:scope => 'publish_stream, email'}
  end

  if Rails.env.production?
    # PROD versions of API keys
    config.omniauth :twitter, "-------------", "-----------------------------"
    config.omniauth :facebook, '1383730465191729', '8627fdbaeefebf7a79a3f80b9e36ccbe', {:scope => 'publish_stream, email'}
  end

  # ==> Warden configuration
  # If you want to use other strategies, that are not supported by Devise, or
  # change the failure app, you can configure them inside the config.warden block.
  #
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(:scope => :user).unshift :some_external_strategy
  # end

  # ==> Mountable engine configurations
  # When using Devise inside an engine, let's call it `MyEngine`, and this engine
  # is mountable, there are some extra configurations to be taken into account.
  # The following options are available, assuming the engine is mounted as:
  #
  #     mount MyEngine, at: "/my_engine"
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine
  #
  # When using omniauth, Devise cannot automatically set Omniauth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = "/my_engine/users/auth"
end

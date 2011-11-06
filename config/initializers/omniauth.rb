TWITTER_CONSUMER_KEY = ENV['TWITTER_CONSUMER_KEY'] || 'HodgczQokaTElTgRRg1EWQ'
TWITTER_CONSUMER_SECRET = ENV['TWITTER_CONSUMER_SECRET'] || 'VhNZHcEA6KGlo786BRivFniW3IgfeuJt8SyISsl9Ew'
TWITTER_OAUTH_TOKEN = ENV['TWITTER_OAUTH_TOKEN'] || '120721602-zRmrYx7KIvjJtRKKN7gZWbO8sTLy86x0RHWHm0Z7'
TWITTER_OAUTH_SECRET = ENV['TWITTER_OAUTH_SECRET'] || '5Qqvg9tn3lJ2WArxY8oFLwXq3w1NmwvkzpYSEakkc'

FACEBOOK_APP_ID = ENV['FACEBOOK_APP_ID'] || '296965670321484'
FACEBOOK_APP_SECRET = ENV['FACEBOOK_APP_SECRET'] || '87cd76e7b338fb36173cbf3fd6119055'

if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET
  case Rails.env
  when "production"
    provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, {:scope => 'publish_stream,offline_access,email', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
  else
    provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET,{ :scope => 'publish_stream,offline_access,email' }
  end
end

Twitter.configure do |config|
  config.consumer_key = TWITTER_CONSUMER_KEY
  config.consumer_secret = TWITTER_CONSUMER_SECRET
  config.oauth_token = TWITTER_OAUTH_TOKEN
  config.oauth_token_secret = TWITTER_OAUTH_SECRET
end

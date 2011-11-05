TWITTER_CONSUMER_KEY = ENV['TWITTER_CONSUMER_KEY'] || 'HodgczQokaTElTgRRg1EWQ'
TWITTER_CONSUMER_SECRET = ENV['TWITTER_CONSUMER_SECRET'] || 'VhNZHcEA6KGlo786BRivFniW3IgfeuJt8SyISsl9Ew'
TWITTER_OAUTH_TOKEN = ENV['TWITTER_OAUTH_TOKEN'] || '120721602-zRmrYx7KIvjJtRKKN7gZWbO8sTLy86x0RHWHm0Z7'
TWITTER_OAUTH_SECRET = ENV['TWITTER_OAUTH_SECRET'] || '5Qqvg9tn3lJ2WArxY8oFLwXq3w1NmwvkzpYSEakkc'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET
end

Twitter.configure do |config|
  config.consumer_key = TWITTER_CONSUMER_KEY
  config.consumer_secret = TWITTER_CONSUMER_SECRET
  config.oauth_token = TWITTER_OAUTH_TOKEN
  config.oauth_token_secret = TWITTER_OAUTH_SECRET
end

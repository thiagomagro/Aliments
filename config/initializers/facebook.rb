# config/initializers/facebook.rb

module Facebook
  CONFIG = YAML.load_file(Rails.root + "/config/facebook.yml")[Rails.env]
  #APP_ID = CONFIG['app_id']
  #SECRET = CONFIG['secret_key']
  #PERMS = CONFIG['perms']
  #CALLBACK_URL = CONFIG['callback_url']
end
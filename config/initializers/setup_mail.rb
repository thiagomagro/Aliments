ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,
#  :port                 => 465,
  :domain               => "aliments.com.br", 
  :user_name            => "alimentscombr",
  :password             => "aliments#diveo",  
  :authentication       => "plain",
#  :openssl_verify_mode => 'none',
  :enable_starttls_auto => true  
}
ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.perform_deliveries = true
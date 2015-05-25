Rails.configuration.stripe do |config| 
  config.publishable_key = ENV['STRIPE_PUBLISHABLE_KEY'],
  config.secret_key = ENV['STRIPE_SECRET_KEY']
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
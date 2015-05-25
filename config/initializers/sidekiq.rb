require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == (ENV['SIDEKIQ_USER'] || 'user') && password == (ENV['SIDEKIQ_PASS'] || 'password')
end

Sidekiq.configure_server do |sidekiq_config|

  # Configure ActiveRecord
  puts 'Sidekiq - configure ActiveRecord'
  config = ActiveRecord::Base.configurations[Rails.env] ||
              Rails.application.config.database_configuration[Rails.env]
  config['pool'] = ENV['WORKER_DB_POOL'] || ENV['DB_POOL'] || 16
  puts "Sidekiq - config: #{config}"
  ActiveRecord::Base.establish_connection(config)
end

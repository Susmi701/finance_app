Sidekiq.configure_server do |config|
    config.on(:startup) do
      Sidekiq.schedule = {
        'my_job' => {
          'class' => 'MyJob',
          'cron' => '*/1 * * * *',  # Run every minute
          'queue' => 'default'
        }
      }
      Sidekiq::Scheduler.reload_schedule!
    end
  
    config.redis = { url: 'redis://localhost:6379/0' }  # Redis configuration for Sidekiq server
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0' }  # Redis configuration for Sidekiq client
  end
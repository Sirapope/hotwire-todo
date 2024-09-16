require 'sidekiq'
require 'sidekiq-cron'

Sidekiq::Cron::Job.create(
  name: "reminder",
  cron: "* * * * *",
  class: "OverdueCheckJob"
)
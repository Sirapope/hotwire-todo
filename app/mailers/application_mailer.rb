class ApplicationMailer < ActionMailer::Base
  default from: "noreply@yourdomain.com"
  layout "mailer"
  after_action :add_to_deliveries

  private

  def add_to_deliveries
    ActionMailer::Base.deliveries << message if ActionMailer::Base.deliver_later_queue_name.nil?
  end
end

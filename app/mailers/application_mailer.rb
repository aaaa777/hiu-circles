class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mailer[:user_name]
  layout "mailer"
end

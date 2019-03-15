class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("SMTP_FROM") { "admin@codeconnections.com" }
  layout 'mailer'
end

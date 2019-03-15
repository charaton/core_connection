ActionMailer::Base.smtp_settings = {
  address:              "email-smtp.us-west-2.amazonaws.com",
  port:                 587,
  enable_starttls_auto: true,
  authentication:       :plain,
  user_name:            ENV["SMTP_USERNAME"],
  password:             ENV["SMTP_PASSWORD"]
}

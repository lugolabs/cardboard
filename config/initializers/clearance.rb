Clearance.configure do |config|
  config.mailer_sender = ENV['mailer_sender']
  config.rotate_csrf_on_sign_in = true
end

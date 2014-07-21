OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '309428675901394', 'bb93a431aa2c57f02f93b6a3a0d7c38b', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
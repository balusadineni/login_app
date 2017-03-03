OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '801944351486-0oa8l4i7bl0uis03bguussqk3k9gm0db.apps.googleusercontent.com', 'C6R2qA6ghYw-nxHGpCCW1lCk', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

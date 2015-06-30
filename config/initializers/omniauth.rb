Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, ENV['1603524169929729'], ENV['ee3ae41b2f8a04c68d12ea9aab0a7cb5'], :scope => 'public_profile,email,user_birthday,read_stream', :display => 'popup'
  provider :facebook, ENV['1603524169929729'], ENV['ee3ae41b2f8a04c68d12ea9aab0a7cb5'], :scope => 'email,user_birthday,read_stream', :display => 'popup'
end
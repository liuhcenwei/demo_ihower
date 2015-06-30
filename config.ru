# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
#require 'bundler/setup'
#require 'omniauth-facebook'
#require './app.rb'

#use Rack::Session::Cookie, :secret => 'abc123'

#use Omniauth::Builder do
#  provider :facebook, ENV['1603524169929729'], ENV['ee3ae41b2f8a04c68d12ea9aab0a7cb5'], :scope => 'public_profile,email,read_stream,user_birthday'
#end

#run Sinatra::Application
run Rails.application

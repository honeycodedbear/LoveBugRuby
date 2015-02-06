require 'rubygems'
require 'bundler'
Bundler.require(:default)
require './config/environments' #database configuration

configure do
  #APNS.host = 'gateway.push.apple.com' #pro mode
  APNS.host = 'gateway.sandbox.push.apple.com' #dev mode
  APNS.port = 2195
  APNS.pem  = '/cert.perm'
  APNS.pass = 'Maxsgr8!'
end

get "/" do
  "hello world"
end

device_token = '123abc456def'
APNS.send_notification(device_token, :alert => 'Hello iPhone!', :badge => 1, :sound => 'default')

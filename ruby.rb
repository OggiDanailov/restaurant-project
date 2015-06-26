require 'sinatra'
require 'sinatra/reloader'
require 'mandrill'

get '/' do
  @current_page = 'home'
	erb :home
end

get '/gallery' do 
  @current_page = 'gallery'
  erb :gallery
end

get '/contact' do 
  @current_page = 'contact'
  erb :contact
end

get '/menu' do 
  @current_page = 'menu'
  @title = 'menu'
  erb :menu
end

# get 'send-reservation' do 
#   mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
#   message = {to: [{"type"  => "to"
#                    "email" => "TheirEmailAddress@Here.com"
#                    "name"  => "to name"}],
#               subject: "reservation confirmation"
#               from: "OurEmailAddress@Here.com"
#               text: "you are confirmed for your reservation!"}

#   puts mandrill.messages.send(message)

# end
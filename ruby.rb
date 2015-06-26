require 'sinatra'
require 'sinatra/reloader'
require 'mandrill'

get '/' do
	@header="Hello World"
	erb :home
end

get '/gallery' do 
  erb :gallery
end

get '/contact' do 
  erb :contact
end

get '/menu' do 
  erb :menu
end

get 'send-reservation' do 
  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
  message = {to: [{"type"  => "to"
                   "email" => "TheirEmailAddress@Here.com"
                   "name"  => "to name"}],
              subject: "reservation confirmation"
              from: "OurEmailAddress@Here.com"
              text: "you are confirmed for your reservation!"}

  puts mandrill.messages.send(message)

end
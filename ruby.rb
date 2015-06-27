require 'sinatra'
require 'sinatra/reloader'
require 'mandrill'

get '/' do
  @current_page = 'home'
  @title = "Home"
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

get '/confirmation' do 
  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
    message = {to: [{"type"  => "to",
                   "email" => "stephanierenee.mathison@gmail.com",
                   "name"  => "to Stephanie"}],
              subject: "reservation confirmation",
              from: "OurEmailAddress@Here.com",
              text: "you are confirmed for your reservation!"}

  puts mandrill.messages.send(message)
end

post '/confirmation' do
  @current_page = 'confirmation'
  @title = 'confirmation'
  @your_message = params[]
  erb :contact_confirmation
end







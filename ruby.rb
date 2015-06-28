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

get '/reservation' do
  @current_page = 'reservation'
  @title = 'reservation'
  @user_message = params["user_message"]
  erb :contact_confirmation
end

post '/reservation' do 
  puts params.inspect
  user_message = params["user_message"]
  email = params["stephanierenee.mathison@gmail.com"]
  message = params["message"]
  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
    message = {
              :subject=> "Reservation Confirmation",
              :to=> [{
                      :email=> "stephanierenee.mathison@gmail.com",
                      :name=> "Bar OSA",
                    }],
              :from_email=> "stephanierenee.mathison@gmail.com",
              :message=>"you are confirmed for your reservation! #{user_message}"}

  sending = mandrill.messages.send(message)
  puts sending
  redirect to('/reservation')
end

post '/reservation' do
  @current_page = 'reservation'
  @title = 'reservation'
  @user_message = params["user_message"]
  erb :contact_confirmation
end







require 'sinatra'
require 'sinatra/reloader'
# require 'mandrill-api'

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
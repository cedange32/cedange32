require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

post "/restaurants" do  
  name = params["name"]
  address = params["address"]
  Restaurant.create(name: name, address: address)
  redirect to("/")
end

get "/restaurants/new" do
  erb :new
end

get '/restaurants/:id' do
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end
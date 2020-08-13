require 'yaml'
require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @users = YAML.load_file("users.yaml")
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/:user_id" do
  @user = params[:user_id].to_sym
  @email = @users[@user][:email]
  @interests = @users[@user][:interests]
  erb :user
end

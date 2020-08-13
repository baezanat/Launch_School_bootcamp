require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get "/" do
  @contents = Dir.glob("files/*").map { |file| File.basename(file) }.sort
  @contents.reverse! if params[:sort] == "desc"
  erb :home
end


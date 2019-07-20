require 'sinatra'
require_relative 'upload.rb'

get '/' do
  haml :app
end

post '/' do
  upload_problem(params[:problem], params[:type])
  "Thank you for your submission!"
end

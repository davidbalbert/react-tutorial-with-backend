require 'bundler/setup'
require 'sinatra'

require 'json'

get '/' do
  File.read "index.html"
end

get '/comments.json' do
  File.read "comments.json"
end

post '/comments.json' do
  comments = JSON.parse(File.read("comments.json"))
  comments << params

  json = JSON.pretty_generate(comments)

  File.open("comments.json", "w") { |f| f.write(json) }

  json
end

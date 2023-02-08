require 'sinatra/base'
require 'sinatra/reloader'
require './lib/news_search.rb'

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @news = News.new("balloon").search
    erb :layout
  end

end
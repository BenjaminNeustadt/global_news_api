require 'sinatra/base'
require 'sinatra/reloader'
require './lib/news_search.rb'

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @query = params[:topic] || "recent news"
    @news = News.new(@query).search
    erb :layout
  end

end
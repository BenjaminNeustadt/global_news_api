require 'dotenv/load'
require 'net/http'
require 'json'

class News

  API_KEY = ENV['PERSONAL_API_KEY']
  NEWS_URL = "https://newsapi.org/v2/everything?q=%<topic>s&from=2023-01-08&sortBy=publishedAt&apiKey=#{API_KEY}"

  def initialize(query)
    @query = query
    @url = NEWS_URL % {topic: query}  
  end

  attr_reader :url

  def search
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

end
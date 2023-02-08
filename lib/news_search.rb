require 'dotenv/load'
require 'net/http'
require 'json'

class News

API_KEY = ENV['PERSONAL_API_KEY']


 #  NEWS_URL = "https://newsapi.org/v2/everything?q=tesla&from=2023-01-08&sortBy=publishedAt&apiKey=API_KEY"

  def search
    url = "https://newsapi.org/v2/everything?q=ukraine&from=2023-01-08&sortBy=publishedAt&apiKey=#{API_KEY}"
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

end
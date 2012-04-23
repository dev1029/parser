class YandexMarketSearcher
  attr_accessor :keywords

  def initialize(keywords)
    self.keywords = URI.encode(keywords)
  end

  delegate :body, :to => :response, :prefix => true

  private
    def yandex_market_url
      'http://market.yandex.ru'
    end

    def path
      path = 'search.xml?'
      path << "text=#{keywords}"
      path << "&cvredirect=1"
    end

    def request_url
      "#{yandex_market_url}/#{path}"
    end

    def response
      HTTParty.get(request_url)
    end
end

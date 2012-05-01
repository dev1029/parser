module Ymp
  class Searcher
    attr_accessor :keywords, :proxy

    def initialize(keywords, proxy = nil)
      self.keywords = URI.encode(keywords)
      self.proxy = proxy
    end

    delegate :body, :to => :response, :prefix => true

    delegate :address, :password, :port, :user, 
             :to => :proxy, 
             :prefix => true, 
             :allow_nil => true

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
        HTTParty.get(request_url,
                     :http_proxyuser => proxy_user,
                     :http_proxypass => proxy_password,
                     :http_proxyaddr => proxy_address,
                     :http_proxyport => proxy_port)
      end
  end
end

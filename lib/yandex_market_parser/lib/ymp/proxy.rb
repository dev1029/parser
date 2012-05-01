module Ymp
  class Proxy
    attr_accessor :address, :password, :port, :user

    def initialize(proxy)
      if proxy.match('@')
        self.user, self.password = proxy.split('@').first.split(':')
        self.address, self.port = proxy.split('@').last.split(':')
      else
        self.address, self.port = proxy.split('@').last.split(':')
      end
    end

    def to_s
      "#{address}:#{port}"
    end

    def working?
      begin
        test_request_success?
      rescue
        false
      end
    end

    private
      def test_request
        HTTParty.get 'http://example.com',
                     :http_proxyuser => user,
                     :http_proxypass => password, 
                     :http_proxyaddr => address,
                     :http_proxyport => port,
                     :timeout => 10
      end

      def test_request_success?
        test_request.code == 200
      end
  end
end

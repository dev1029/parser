class Proxy
  attr_accessor :address, :port

  def initialize(proxy)
    self.address, self.port = proxy.split(':')
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
                   :http_proxyaddr => address,
                   :http_proxyport => port,
                   :timeout => 10
    end

    def test_request_success?
      test_request.code == 200
    end
end

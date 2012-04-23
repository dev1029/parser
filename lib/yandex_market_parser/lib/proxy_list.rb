class ProxyList
  attr_accessor :proxies

  def initialize(*proxies)
    self.proxies = proxies
  end

  def proxy
    proxy_list.rotate!.first
  end

  private
    def proxy_list
      @proxy_list ||= proxies.flatten.map { |proxy| Proxy.new proxy }
    end
end

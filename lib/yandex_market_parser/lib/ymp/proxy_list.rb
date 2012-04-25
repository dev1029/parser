module Ymp
  class ProxyList
    attr_accessor :proxies

    def initialize(*proxies)
      self.proxies = proxies
    end

    def proxy
      working_proxies.rotate!.first
    end

    private
      def proxy_list
        @proxy_list ||= proxies.flatten.map { |proxy| Proxy.new proxy }
      end

      def working_proxies
        @working_proxies ||= proxy_list.select(&:working?)
      end
  end
end

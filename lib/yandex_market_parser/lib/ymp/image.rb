require 'httparty'

module Ymp
  class Image
    attr_accessor :url, :proxy

    def initialize(url, proxy = nil)
      self.url = url
      self.proxy = proxy
    end

    def file
      tempfile
    end

    def delete_file
      File.delete file_name
    end

    private
      def random_name
        @random_name ||= "#{Rails.root.join('tmp', SecureRandom.hex)}"
      end

      alias :file_name :random_name

      def tempfile
        File.open(file_name, 'wb').tap { |file|
          file.write raw_image
          file.close
        }
      end

      delegate :address, :password, :port, :user,
               :to => :proxy,
               :prefix => true,
               :allow_nil => true

      def raw_image
        HTTParty.get(url,
                     :http_proxyuser => proxy_user,
                     :http_proxypass => proxy_password, 
                     :http_proxyaddr => proxy_address,
                     :http_proxyport => proxy_port).body
      end
  end
end



require 'httparty'

module Ymp
  class Image
    attr_accessor :url

    def initialize(url)
      self.url = url
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

      def raw_image
        HTTParty.get(url).body
      end
  end
end



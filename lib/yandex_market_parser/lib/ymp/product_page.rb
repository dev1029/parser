module Ymp
  class ProductPage
    attr_accessor :document

    def initialize(html)
      self.document = Nokogiri::HTML(html)
    end

    def title
      title_element.text
    end

    def description
      description_element.map(&:text).join('; ')
    end

    def image_url
      a_element ? a_href : img_src
    end

    def valid?
      !!model_info_table_element_exists?
    end

    def to_s
      "#{title}"
    end

    private
      def title_selector
        'h1.b-page-title_type_model'
      end

      def title_element
        document.at_css title_selector
      end

      def description_selector
        'ul.b-vlist_type_friendly li'
      end

      def description_element
        document.css description_selector
      end

      def span_with_img_selector
        'span.b-model-pictures__big'
      end

      def a_selector
        "#{span_with_img_selector} a"
      end

      def a_element
        document.at_css a_selector
      end

      def a_href
        a_element.attr 'href'
      end

      def img_selector
        "#{span_with_img_selector} img"
      end

      def img_element
        document.at_css img_selector
      end

      def img_src
        img_element.attr 'src'
      end

      def model_info_table_element
        document.at_css 'table.b-modelinfo'
      end

      alias :model_info_table_element_exists? :model_info_table_element
  end
end
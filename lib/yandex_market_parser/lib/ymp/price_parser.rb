module Ymp
  class PriceParser
    attr_accessor :xml_path

    def initialize(xml_path)
      self.xml_path = xml_path
    end

    def categories
      category_nodes.map { |node|
        Category.new :id => category_id(node),
                     :parent_id => category_parent_id(node),
                     :name => category_name(node)
      }
    end

    def offers(*category_ids)
      category_ids.any? ? offers_with_category_ids(category_ids) : all_offers
    end

    alias :to_s :xml_path

    private
      def file_content
        File.open(xml_path).read
      end

      def document
        Nokogiri::XML file_content
      end

      def category_nodes
        document.xpath '//category'
      end

      def category_id(node)
        node.attr 'id'
      end

      def category_parent_id(node)
        node.attr 'parent_id'
      end

      def category_name(node)
        node.text
      end

      def offer_nodes
        document.xpath '//offer'
      end

      def offer_name(node)
        node.at_xpath('name').text
      end

      def offer_category_id(node)
        node.at_xpath('categoryId').text
      end

      def all_offers
        offer_nodes.map { |node|
          Offer.new :category_id => offer_category_id(node),
                    :name => normalized_offer_name(offer_name(node))
        }
      end

      def offers_with_category_ids(*ids)
        ids_to_i = ids.flatten.map(&:to_i)

        all_offers.select { |offer| ids_to_i.include? offer.category_id }
      end

      def normalized_offer_name(name)
        MonitorNameNormalizer.new.normalize name
      end
  end
end

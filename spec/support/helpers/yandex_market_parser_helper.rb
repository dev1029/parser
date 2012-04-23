module YandexMarketParserHelper
  def spec_root
    Rails.root.join('..', '..', 'spec')
  end

  def product_page_with_big_image
    File.open("#{spec_root}/fixtures/product.html").read
  end

  def product_page_without_big_image
    File.open("#{spec_root}/fixtures/product2.html").read
  end

  def list_products_page
    File.open("#{spec_root}/fixtures/product3.html").read
  end

  def price_xml_path
    "#{spec_root}/fixtures/price.xml"
  end
end

module YandexMarketParserHelper
  def spec_root
    Rails.root.join('..', '..', 'spec')
  end

  def fixtures_path
    "#{spec_root}/fixtures"
  end

  def product_page_with_big_image
    File.open("#{fixtures_path}/product.html").read
  end

  def product_page_without_big_image
    File.open("#{fixtures_path}/product2.html").read
  end

  def list_products_page
    File.open("#{fixtures_path}/product3.html").read
  end

  def price_xml_path
    "#{fixtures_path}/price.xml"
  end

  def raw_image
    File.open("#{fixtures_path}/image.jpg").read
  end
end

# encoding: utf-8

require 'spec_helper'

describe Ymp::ProductPage do
  let(:properties) {
    [
      'ЖК-монитор с диагональю 19"',
      "тип ЖК-матрицы TFT TN",
      "разрешение 1440x900",
      "подключение:  VGA, DVI",
      "яркость 300 кд/м2",
      "контрастность 1000:1",
      "время отклика 5 мс"
    ]
  }

  let(:product_page1) { Ymp::ProductPage.new(product_page_with_big_image) }
  let(:product_page2) { Ymp::ProductPage.new(product_page_without_big_image) }
  let(:product_page3) { Ymp::ProductPage.new(list_products_page) }

  it { product_page1.should be_valid }
  it { product_page1.title.should == 'Samsung SyncMaster 943BW' }
  it { product_page1.properties.should == properties }
  it { product_page1.image_url.should == 'http://mdata.yandex.net/i?path=b0711235548__img_.jpg' }

  it { product_page2.should be_valid }
  it { product_page2.title.should == 'Acer V193Wb' }
  it { product_page2.image_url.should == 'http://mdata.yandex.net/i?path=b0629221308__Acer_V193W.jpg' }

  it { product_page3.should_not be_valid }
end

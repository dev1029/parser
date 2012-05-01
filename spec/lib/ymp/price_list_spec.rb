# encoding: utf-8

require 'spec_helper'

describe Ymp::PriceList do
  let(:monitor_category_ids) { [162, 163, 164, 165, 166] }

  let(:price_parser) { Ymp::PriceList.new price_xml_path }
  let(:categories) { price_parser.categories }
  let(:monitor_offers) { price_parser.offers *monitor_category_ids }

  it { price_parser.exchange_rate.should == 29.7 }

  it { categories.first.name.should == 'Процессоры' }

  it { monitor_offers.first.category_id.should == 162 }
  it { monitor_offers.first.name.should == 'Монитор 17" ViewSonic VA1703WB, 5ms, Analogue, 1280x1024, Cont. 700:1, Brightness 300 cd/m?, TCO03,' }
  it { monitor_offers.first.price.should == 130 }
end


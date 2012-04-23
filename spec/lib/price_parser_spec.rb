# encoding: utf-8

require 'spec_helper'

describe PriceParser do
  let(:monitor_category_ids) { [162, 163, 164, 165, 166] }

  let(:price_parser) { PriceParser.new price_xml_path }
  let(:categories) { price_parser.categories }
  let(:monitor_offers) { price_parser.offers *monitor_category_ids }

  it { categories.first.name.should == 'Процессоры' }

  it { monitor_offers.first.category_id.should == 162 }
  it { monitor_offers.first.name.should == 'ViewSonic VA1703WB' }
end


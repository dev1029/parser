require 'spec_helper'

describe Ymp::Offer do
  subject { Ymp::Offer.new :category_id => '111', :name => 'name', :price => '100' }

  its(:category_id) { should == 111 }
end

require 'spec_helper'

describe Offer do
  subject { Offer.new :category_id => '111', :name => 'name' }

  its(:category_id) { should == 111 }
end

require 'spec_helper'

describe Ymp::Category do
  subject { Ymp::Category.new :id => '111', :parent_id => '222', :name => 'name' }

  its(:id) { should == 111 }
  its(:parent_id) { should == 222 }
end

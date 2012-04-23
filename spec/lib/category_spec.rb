require 'spec_helper'

describe Category do
  subject { Category.new :id => '111', :parent_id => '222', :name => 'name' }

  its(:id) { should == 111 }
  its(:parent_id) { should == 222 }
end

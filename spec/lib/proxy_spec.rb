require 'spec_helper'

describe Proxy do
  subject { Proxy.new '111.111.111.111:111' }

  its(:address) { should == '111.111.111.111' }
  its(:port) { should == '111' }
end

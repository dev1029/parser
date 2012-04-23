require 'spec_helper'

describe Ymp::Proxy do
  subject { Ymp::Proxy.new '111.111.111.111:111' }

  its(:address) { should == '111.111.111.111' }
  its(:port) { should == '111' }
end

require 'spec_helper'

describe Ymp::Proxy do
  context 'without auth' do
    subject { Ymp::Proxy.new '111.111.111.111:111' }

    its(:address) { should == '111.111.111.111' }
    its(:port) { should == '111' }
  end

  context 'with auth' do
    subject { Ymp::Proxy.new 'user:password@host:port' }

    its(:address) { should == 'host' }
    its(:port) { should == 'port' }
    its(:user) { should == 'user' }
    its(:password) { should == 'password' }
  end
end

require 'spec_helper'

describe ProxyList do
  let(:proxies) { ['1.1.1.1:11', '2.2.2.2:22'] }

  before :all do
    @proxy_list = ProxyList.new *proxies
  end

  it { @proxy_list.proxy.to_s.should == '2.2.2.2:22' }
  it { @proxy_list.proxy.to_s.should == '1.1.1.1:11' }
  it { @proxy_list.proxy.to_s.should == '2.2.2.2:22' }
end

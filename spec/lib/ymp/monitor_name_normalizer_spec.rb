#encoding: utf-8

require 'spec_helper'

describe Ymp::MonitorNameNormalizer do
  subject { Ymp::MonitorNameNormalizer.new }

  it { subject.normalize('LCD Acer AL1916Nb 5ms"').should == 'Acer AL1916Nb' }

  it { subject.normalize('TFT Benq FP73ES 5ms').should == 'Benq FP73ES' }
  it { subject.normalize(' TFT Benq X2200W 2ms(GTG)').should == 'Benq X2200W' }

  it { subject.normalize('LG Flatron L1972H-PF').should == 'LG Flatron L1972H' }

  it { subject.normalize('NEC LCD203WM <1680x1050').should == 'NEC LCD203WM' }
  it { subject.normalize('NEC LCD205WXM Silver/Black <1680x1050').should == 'NEC LCD205WXM' }

  it { subject.normalize('Samsung 245T (EBQ)  TFT').should == 'Samsung 245T' }
  it { subject.normalize('Samsung 932BF(DSFU)').should == 'Samsung 932BF' }

  it { subject.normalize('ViewSonic VA1703WB, ').should == 'ViewSonic VA1703WB' }
  it { subject.normalize('ViewSonic VX2240W').should == 'ViewSonic VX2240W' }
end

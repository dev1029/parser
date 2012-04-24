#encoding: utf-8

require 'spec_helper'

describe Ymp::Image do
  subject { Ymp::Image.new 'image_url' }

  let(:raw_file) { File.open(subject.file.path).read }

  before { subject.stub(:raw_image).and_return(raw_image) }

  it { raw_file.should == raw_image }

  after { subject.delete_file }
end

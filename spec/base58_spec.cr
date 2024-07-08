require "./spec_helper"

describe "Base58" do
  it "should return a size 16 base58 string" do
    str = Random.base58
    str.size.should eq 16
    str.should_not contain "0"
    str.should_not contain "O"
    str.should_not contain "I"
    str.should_not contain "l"
  end

  it "should return a size 20 base58 string" do
    str = Random.base58(20)
    str.size.should eq 20
    str.should_not contain "0"
    str.should_not contain "O"
    str.should_not contain "I"
    str.should_not contain "l"
  end

  it "should return a size 64 base58 string" do
    str = Random.base58(64)
    str.size.should eq 64
    str.should_not contain "0"
    str.should_not contain "O"
    str.should_not contain "I"
    str.should_not contain "l"
  end

  it "should return a size 80 base58 string" do
    str = Random.base58(80)
    str.size.should eq 80
    str.should_not contain "0"
    str.should_not contain "O"
    str.should_not contain "I"
    str.should_not contain "l"
  end
end

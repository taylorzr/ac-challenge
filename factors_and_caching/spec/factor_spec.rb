require 'rspec'
require_relative '../factor.rb'

describe "factor_list" do 
  let(:input){ [10, 5, 2, 20] }

  it "should return an empty hash for an empty input" do
    expect(factor_list([])).to eq({})
  end
  
  it "should return a hash mapping all numbers to the factors in the list of numbers" do
    expect(factor_list(input)).to eq({2=>[], 5=>[], 10=>[2, 5], 20=>[2, 5, 10]}) 
  end
end

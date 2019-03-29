require 'rails_helper'

RSpec.describe ZoneCalculator do

  before do
    LoadZoneMatrix.call
  end

  it ".call('09060', '34004') should return 1" do
    zone = ZoneCalculator.call('09060', '34004')
    expect(zone).to eq(1)
  end
end
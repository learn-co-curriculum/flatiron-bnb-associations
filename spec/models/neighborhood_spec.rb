require 'rails_helper'

describe Neighborhood do
  before do
    @new_york_city = City.create(name: 'NYC')

    @brighton_beach = Neighborhood.create(name: 'Brighton Beach', city: @new_york_city)

    @arel = User.create(name: "Arel")

    @listing = Listing.create(
        address: '44 Ridge Lane',
        listing_type: "whole house",
        title: "Beautiful Home on Mountain",
        description: "Whole house for rent on mountain. Many bedrooms.",
        price: 200.00,
        neighborhood: @brighton_beach,
        host: @arel)

  end
  it 'has a name' do
    expect(@brighton_beach.name).to eq('Brighton Beach')
  end

  it 'belongs to a city' do
    expect(@brighton_beach.city.name).to eq('NYC')
  end

  it 'has many listings' do
    expect(@brighton_beach.listings).to eq([@listing])
  end

end

require 'rails_helper'

describe Reservation do
  before do
    @new_york_city = City.create(name: 'NYC')

    @financial_district = Neighborhood.create(name: 'Fi Di', city: @new_york_city)

    @amanda = User.create(name: "Amanda")

    @listing = Listing.create(
        address: '123 Main Street',
        listing_type: "private room",
        title: "Beautiful Apartment on Main Street",
        description: "My apartment is great. there's a bedroom. close to subway....blah blah",
        price: 50.00,
        neighborhood: @financial_district,
        host: @amanda)

    @reservation = Reservation.create(
        checkin: '2014-04-25',
        checkout: '2014-04-30',
        listing: @listing,
        guest: @logan)
  end
  it 'has a checkin time' do
    expect(@reservation.checkin).to eq(Date.parse('2014-04-25'))
  end

  it 'has a checkout time' do
    expect(@reservation.checkout).to eq(Date.parse('2014-04-30'))
  end

  it 'belongs to a guest' do
    expect(@reservation.guest).to eq(@logan)
  end

  it 'belongs to a listing' do
  expect(@reservation.listing).to eq(@listing)
  end

end

require 'rails_helper'

describe Review do
  before do
    @new_york_city = City.create(name: 'NYC')

    @financial_district = Neighborhood.create(name: 'Fi Di', city: @new_york_city)

    @logan = User.create(name: "Logan")
    @amanda = User.create(name: "Amanda")

    @listing = Listing.create(
        address: '123 Main Street',
        listing_type: "private room",
        title: "Beautiful Apartment on Main Street",
        description: "My apartment is great. There's a bedroom. Close to subway",
        price: 50.00,
        neighborhood: @financial_district,
        host: @amanda)

    @reservation = Reservation.create(
        checkin: '2014-04-25',
        checkout: '2014-04-30',
        listing: @listing,
        guest: @logan)

    @review = Review.create(
        description: "This place was great!",
        rating: 5,
        guest: @logan,
        reservation: @reservation)
  end

  it 'has a description' do
    expect(@review.description).to eq("This place was great!")
  end

  it 'has a rating' do
    expect(@review.rating).to eq(5)
  end

  it 'belongs to a guest' do
    expect(@review.guest).to eq(@logan)
  end

  it 'belongs to a reservation' do
    expect(@review.reservation).to eq(@reservation)
  end

end

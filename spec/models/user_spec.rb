require 'rails_helper'

describe User do
  before do
    @new_york_city = City.create(name: 'NYC')
    @green_point = Neighborhood.create(name: 'Green Point', city: @new_york_city)

    @katie = User.create(name: "Katie")
    @logan = User.create(name: "Logan")

    @listing = Listing.create(
        address: '6 Maple Street',
        listing_type: "shared room",
        title: "Shared room in apartment",
        description: "share a room with me because I'm poor",
        price: 15.00,
        neighborhood: @green_point,
        host: @katie)

    @reservation = Reservation.create(
        checkin: '2014-04-25',
        checkout: '2014-04-30',
        listing: @listing,
        guest: @logan)

    @review = Review.create(
        description: "Meh, the host I shared a room with snored.",
        rating: 3,
        guest: @logan,
        reservation: @reservation)
  end

  it 'has a name' do
    expect(@katie.name).to eq("Katie")
  end

  it 'as a host has many listings' do
    expect(@katie.listings).to include(@listing)
  end

  it 'as a guest has many trips' do
    expect(@logan.trips).to include(@reservation)
  end

  it 'as a host has many reservations through their listing' do
    expect(@katie.reservations).to include(@reservation)
  end

  it 'as a guest has written many reviews' do
    expect(@logan.reviews).to include(@review)
  end

end

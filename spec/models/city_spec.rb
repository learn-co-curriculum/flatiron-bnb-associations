require 'rails_helper'

describe City do
  let(:new_york_city) { City.create(name: 'NYC') }

  it 'has a name' do
    expect(new_york_city.name).to eq('NYC')
  end

  it 'has many neighborhoods' do
    financial_district = Neighborhood.create(name: 'Fi Di', city: new_york_city)
    green_point = Neighborhood.create(name: 'Green Point', city: new_york_city)
    brighton_beach = Neighborhood.create(name: 'Brighton Beach', city: new_york_city)

    expect(new_york_city.neighborhoods).to eq([financial_district, green_point, brighton_beach])
  end
end

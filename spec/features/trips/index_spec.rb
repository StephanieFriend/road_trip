require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I see title of trips listed in order of mileage' do
    trip1 = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison WI",
                        mileage: 1100)

    trip2 = Trip.create(title: "Who is America Anyway?",
                        destination_city: "Washington, D.C.",
                        mileage: 300)

    trip3 = Trip.create(title: "The Big Apple",
                        destination_city: "New York City, NY",
                        mileage: 850)

    trip4 = Trip.create(title: "Bike n’ Climb",
                        destination_city: "Moab, UT",
                        mileage: 700)

    visit '/trips'

    expect(trip2.title).to appear_before(trip4.title)
    expect(trip4.title).to appear_before(trip3.title)
    expect(trip3.title).to appear_before(trip1.title)
    expect(trip1.title).to_not appear_before(trip2.title)
  end
end

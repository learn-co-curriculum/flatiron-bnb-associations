class User < ActiveRecord::Base
  has_many :listings, :foreign_key => 'host_id'
  has_many :reviews, :foreign_key => 'guest_id'

  def reservations
    Reservation.where("guest_id = ? OR listing_id IN (?)", id, listings.select(:id))
  end

  def trips
    reservations
  end
end

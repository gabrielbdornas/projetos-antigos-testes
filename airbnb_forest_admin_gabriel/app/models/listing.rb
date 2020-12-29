class Listing < ApplicationRecord
  has_many :bookings
  enum home_type: [:shared_room, :entire_place, :private_room]
end

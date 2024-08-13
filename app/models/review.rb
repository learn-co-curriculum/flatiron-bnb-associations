class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :guest, :class_name => "User"
end

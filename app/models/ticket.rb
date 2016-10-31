class Ticket < ApplicationRecord
  belongs_to :user
  enum status: [:open]
end

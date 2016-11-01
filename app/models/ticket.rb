class Ticket < ApplicationRecord
  belongs_to :user
  enum status: [:open]
  validates :title, :description, presence: true
end

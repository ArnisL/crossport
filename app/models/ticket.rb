class Ticket < ApplicationRecord
  belongs_to :user
  enum status: [:open, :in_progress, :finished]
  validates :title, :description, presence: true

  scope :by_user, ->(user){ where user: user }
  scope :search, ->(phrase) {
    where("title LIKE ? OR description LIKE ?", "%#{phrase}%", "%#{phrase}%") if phrase.present?
  }

  include AASM
  aasm column: :status, enum: true do
    state :open, initial: true
    state :in_progress, :finished

    event :take do
      transitions from: :open, to: :in_progress
    end

    event :finish do
      transitions from: :in_progress, to: :finished
    end
  end

  def trigger! event
    send("#{event}!") if can_trigger? event
  end

  def can_trigger? event
    aasm.events(permitted: true).map(&:name).include? event.to_sym
  end
end

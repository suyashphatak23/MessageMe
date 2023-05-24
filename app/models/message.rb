class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  broadcasts_to ->(message) { "messages" }
  scope :custom_display, -> { order(:created_at).last(20) }
end

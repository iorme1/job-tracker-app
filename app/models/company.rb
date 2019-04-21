class Company < ApplicationRecord
  belongs_to :user

  default_scope { order("created_at DESC") }

  enum status: [:pending, :rejected, :inquired]

  after_commit :pending_status, on: :create

  paginates_per 10

  def pending_status
    self.status = "pending"
  end
end

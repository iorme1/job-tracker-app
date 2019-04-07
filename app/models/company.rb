class Company < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :rejected, :inquired]

  after_commit :pending_status, on: :create

  def pending_status
    self.status = "pending"
  end
end

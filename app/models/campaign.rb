class Campaign < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy
  before_create :set_member
  before_create :set_status
  enum status: %i[pending finished]
  validates :title, :description, :user, :status, presence: true

  def set_status
    self.status = :pending
  end

  def set_member
    members << Member.create(name: user.name, email: user.email)
  end
end

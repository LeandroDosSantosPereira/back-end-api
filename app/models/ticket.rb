class Ticket < ApplicationRecord
  validates :title, :user, :ads_id, presence: true
  belongs_to :user
end

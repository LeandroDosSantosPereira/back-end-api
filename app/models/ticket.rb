class Ticket < ApplicationRecord
  mount_base64_uploader :image, ImageUploader
  validates :title, :user, :ads_id, presence: true
  belongs_to :user
end

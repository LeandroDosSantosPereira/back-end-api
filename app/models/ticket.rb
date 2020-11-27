class Ticket < ApplicationRecord
  mount_base64_uploader :image, ImageUploader
  validates :title, :user, :ads_id, :text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end

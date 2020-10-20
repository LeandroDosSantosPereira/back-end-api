class User < ApplicationRecord
  has_secure_password
  has_one_attached :featured_image
  validates :name,  :email, presence: true, uniqueness: true
end

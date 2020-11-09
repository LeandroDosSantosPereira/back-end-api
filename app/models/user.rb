class User < ApplicationRecord
  has_secure_password 
  mount_base64_uploader :photo, PhotoUploader
  validates :name,  :email, presence: true, uniqueness: true
end

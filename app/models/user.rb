class User < ApplicationRecord
  has_secure_password 
  mount_base64_uploader :photo, PhotoUploader
  validates :name,  :email , presence: true, uniqueness: true
  has_many :tickets, dependent: :destroy
  has_many :comments, dependent: :destroy
end

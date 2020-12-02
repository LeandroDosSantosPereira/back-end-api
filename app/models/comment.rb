class Comment < ApplicationRecord
  mount_base64_uploader :image, PostUploader
  validates :text, :ticket,:user, presence: true
  belongs_to :ticket
  belongs_to :user
end

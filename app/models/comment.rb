class Comment < ApplicationRecord
  mount_base64_uploader :image, PostUploader
  validates :text, :ticket,presence: true
  belongs_to :ticket
end

class Comment < ApplicationRecord
  validates :text, :ticket,presence: true
  belongs_to :ticket
end

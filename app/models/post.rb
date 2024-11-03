class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :body, presence: true, length: { minimum: 10, maximum: 250 }
  validates :author, presence: true
end

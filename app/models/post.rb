class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  # belongs_to :user

  validates :body, presence: true, length: { minimum: 10, maximum: 250 }, format: { without: /trump|harris|donald trump|kamala harris/i, message: ": Nothing related to elections please!" }
  validates :author, presence: true
end

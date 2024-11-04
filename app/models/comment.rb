class Comment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true, length: { maximum: 250 }, format: { without: /trump|harris|donald trump|kamala harris/i, message: "Nothing related to elections please!" }
end

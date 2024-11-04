class Comment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true, length: { maximum: 250 }, format: { without: /trump|harris|donaldtrump|kamalaharris/i, message: "Nothing related to elections please!" }
end

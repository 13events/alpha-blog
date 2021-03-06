# frozen_string_literal: true

# Represents an Article object with validates title, description and user_id
# Article object has an association to user.
class Article < ApplicationRecord
  belongs_to :user

  validates :title,
            presence: true,
            length: { minimum: 3, maximum: 50 }
  validates :description,
            presence: true,
            length: { minimum: 10, maximum: 10_000 }
  validates :user_id,
            presence: true
end

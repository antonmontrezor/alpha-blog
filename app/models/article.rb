# frozen_string_literal: true

class Article < ApplicationRecord
  # title/description should be present in order to save a model to a database
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end

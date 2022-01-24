class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  # uniqueness: true is the same as validates_uniqueness_of :name
end
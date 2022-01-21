# frozen_string_literal: true

class User < ApplicationRecord
  # alter an object we are creating through console or users create on web before saving to database
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy # set up a dependant of a user class, so a dependant is deleted if a user is deleted
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  # Adds methods to set and authenticate against a BCrypt password. This mechanism requires you to have a XXX_digest attribute. Where XXX is the attribute name of your desired password.
  has_secure_password
end

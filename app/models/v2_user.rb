class V2User < ApplicationRecord
  validates :name, length: { minimum: 3 }
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 13
  }
  validates :password, length: { minimum: 6 }
end

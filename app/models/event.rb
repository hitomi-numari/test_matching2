class Event < ApplicationRecord
  belongs_to :user
  has_many :applies, dependent: :destroy
  has_many :applies_users, through: :favorites, source: :user
end

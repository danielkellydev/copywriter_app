class Copy < ApplicationRecord
  belongs_to :user
  validates :business_name, presence: true
end

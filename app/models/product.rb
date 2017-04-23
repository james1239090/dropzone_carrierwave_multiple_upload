class Product < ApplicationRecord
  has_one :photo, dependent: :destroy

  accepts_nested_attributes_for :photo
end

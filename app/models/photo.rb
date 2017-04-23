class Photo < ApplicationRecord
  belongs_to :product, optional: true

end

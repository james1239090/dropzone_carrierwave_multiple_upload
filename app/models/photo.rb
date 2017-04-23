class Photo < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploaders :images, PhotoUploader
  serialize :images, JSON # If you use SQLite, add this line.
end

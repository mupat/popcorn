class Picture < ApplicationRecord
  mount_uploader :file, PictureUploader

  belongs_to :picturable, polymorphic: true
end

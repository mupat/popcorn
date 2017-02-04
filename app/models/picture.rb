class Picture < ApplicationRecord
  mount_uploader :file, PictureUploader

  belongs_to :picturable, polymorphic: true

  validates :picturable_id, presence: true

  def name
    attributes['file']
  end
end

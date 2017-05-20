class ServiceSegment < ApplicationRecord
  mount_uploader :image, GenericUploader
  validates :name, presence: true

  belongs_to :service
end

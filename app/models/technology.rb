class Technology < ApplicationRecord
  include Sluggable

  mount_uploader :image, GenericUploader
  mount_uploader :hero_image, GenericUploader

  validates :name, presence: true
  has_many :project_attachments, as: :attachable, dependent: :destroy
end

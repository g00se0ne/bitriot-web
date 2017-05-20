class Package < ApplicationRecord
  include Sluggable

  mount_uploader :image, GenericUploader
  mount_uploader :hero_image, GenericUploader

  belongs_to :service, optional: true
  has_many :project_attachments, as: :attachable
end

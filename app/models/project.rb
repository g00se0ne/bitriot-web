class Project < ApplicationRecord
  include Sluggable

  mount_uploader :hero_image, GenericUploader
  mount_uploader :homepage_image, GenericUploader
  mount_uploader :primary_image, GenericUploader
  mount_uploader :secondary_image, GenericUploader

  validates :name, presence: true
  validates :subtitle, presence: true

  belongs_to :package, optional: true
  has_many :project_attachments
  has_many :services, through: :project_attachments, source: :attachable, source_type: 'Service'
  has_many :technologies, through: :project_attachments, source: :attachable, source_type: 'Technology'

  scope :main, -> { limit(3) }
  scope :ordered, -> { order(position: :asc) }
  scope :published, -> {
    where(published: true)
    .where('published_at IS NULL')
    .or(where('published_at > ?', Time.zone.now))
  }
end

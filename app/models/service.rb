class Service < ApplicationRecord
  include Sluggable

  mount_uploader :hero_image, GenericUploader
  mount_uploader :image, GenericUploader

  validates :name, presence: true
  has_many :project_attachments, as: :attachable
  has_many :projects, through: :project_attachments
  has_many :service_segments

  default_scope -> { order(position: :asc) }

  def to_partial_path
    if name == 'Meet Your Team'
      'services/service_team'
    elsif name == 'Launch'
      'services/service_launch'
    else
      'services/service'
    end
  end
end

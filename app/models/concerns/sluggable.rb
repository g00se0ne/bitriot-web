module Sluggable

  extend ActiveSupport::Concern

  included do
    before_validation :create_slug
    validates :slug, presence: true, format: { with: /[a-z0-9\-]+/ }
  end

  def create_slug
    if slug.blank? && name.present?
      slug = name.downcase.parameterize
    end
  end

  def to_param
    slug
  end
end

class ProjectAttachment < ApplicationRecord
  belongs_to :project
  belongs_to :attachable, polymorphic: true
end

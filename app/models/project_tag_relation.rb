class ProjectTagRelation < ApplicationRecord
  belongs_to :project
  belongs_to :tag
end

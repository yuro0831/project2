class Like < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates_uniqueness_of :project_id, scope: :user_id
end

class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :project_tag_relations, dependent: :destroy
    has_many :projects, through: :project_tag_relations
end

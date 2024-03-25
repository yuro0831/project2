class Project < ApplicationRecord
    belongs_to :user
    mount_uploader :pdf, PdfUploader
    has_many :project_tag_relations, dependent: :destroy
    has_many :tags, through: :project_tag_relations
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    
end

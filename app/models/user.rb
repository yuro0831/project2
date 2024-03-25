class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, presence: true
         validates :profile, length: { maximum: 200 }
         has_many :projects, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_projects, through: :likes, source: :project
         has_many :comments, dependent: :destroy

         mount_uploader :image, ImageUploader      
            
         def already_liked?(project)
            self.likes.exists?(project_id: project.id)
         end
         has_many :messages, dependent: :destroy
         has_many :entries, dependent: :destroy
        end


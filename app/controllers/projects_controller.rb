class ProjectsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
      @projects = Project.all
      @project = Project.find(Like.group(:project_id).order('count(project_id) desc').limit(3).pluck(:project_id))
      @rank_projects = Project.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
    end
    
    def search
      @project = Project.all
      if params[:search] == nil
        @project = params[:tag_id].present? ? Tag.find(params[:tag_id]).projects : Project.all
      else params[:search] == ''
        @project = params[:tag_id].present? ? Tag.find(params[:tag_id]).projects : Project.all
      end
    end

    
    
      def new
        @project = Project.new
      end
    
      def create
        project = Project.new(project_params)
        project.user_id = current_user.id
        if project.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @project = Project.find(params[:id])
        @comments = @project.comments
        @comment = Comment.new
      end
    
      def edit
        @project = Project.find(params[:id])
      end
    
      def update
        project = Project.find(params[:id])
        if project.update(project_params)
          redirect_to :action => "show", :id => project.id
        else
          redirect_to :action => "new"
        end
      end
    
      
      def destroy
        project = Project.find(params[:id])
        project.destroy
        redirect_to action: :index
      end
    

      def ranking
        @projects = Project.all
        @project = Project.find(Like.group(:project_id).order('count(project_id) desc').limit(3).pluck(:project_id))
        @rank_projects = Project.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
      end
    
      private
      def project_params
        params.require(:project).permit(:about,:successfailure,:lesson,:genre,:tag_ids,:pdf)
      end
    
end


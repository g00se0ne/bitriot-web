class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project_show = ProjectShow.new(params)
  end
end

class HomesController < ApplicationController
  def show
    @projects = Project.ordered.limit(3)
  end
end

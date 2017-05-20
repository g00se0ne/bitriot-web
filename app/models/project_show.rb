class ProjectShow
  attr_accessor :params

  delegate(
    :primary_image,
    :secondary_image,
    :hero_image,
    :name,
    :subtitle,
    :how,
    :what,
    :technologies,
    :package,
    to: :project
  )

  def initialize(params)
    @params = params
  end

  def project
    @project ||= Project.find_by(slug: params[:id])
  end

  def projects
    @projects ||= Project.where.not(slug: params[:id]).limit(3)
  end
end

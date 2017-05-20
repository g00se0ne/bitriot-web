class LandingsController < ApplicationController
  def ruby
    @projects = Project.joins(:technologies).where(technologies: { slug: 'rails' })
    @contact = Contact.new
  end

  def san_jose
    @projects = Project.order("RANDOM()").limit(2)
    @contact = Contact.new
  end
end

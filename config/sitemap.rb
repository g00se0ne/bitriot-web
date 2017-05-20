# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://bitriot.co'
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  [
    root_path,
    projects_path,
    services_path,
    new_contact_path,
    '/ruby-on-rails'
  ].each do |static|
    add static
  end

  Project.find_each do |project|
    add project_path(project)
  end
end

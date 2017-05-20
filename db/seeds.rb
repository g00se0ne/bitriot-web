User.create(
  first_name: 'Josh',
  last_name: 'Vandergrift',
  email: 'josh@bitriot.co',
  password: 'password123',
  position: 'Founder & CEO',
  dribbble_uri: 'joshmattvander',
  github_uri: 'joshmattvander',
  instagram_uri: 'joshmattvander'
)

%w(Rails Elixir Phoenix Javascript Angular React Swift).each do |technology|
  Technology.find_or_create_by(
    name: technology,
    slug: technology.downcase.parameterize
  )
end

[
  'UX/UI Design',
  'Full Stack Development',
  'Mobile Development'
].each do |service|
  Service.find_or_create_by(
    name: service,
    slug: service.downcase.parameterize
  )
end

[
  'Zero to V1',
  'Engineering Team',
  'Remote CTO',
  'Design Sprint',
  'UX Design',
  'Prototye'
].each do |package|
  Package.find_or_create_by(
    name: package,
    slug: package.downcase.parameterize
  )
end

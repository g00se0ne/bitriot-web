RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Project' do
    edit do
      field :name
      field :slug
      field :published_at
      field :published
      field :position

      field :subtitle
      field :what
      field :how
      field :quote

      field :hero_image
      field :homepage_image
      field :primary_image
      field :secondary_image

      field :package
      field :services
      field :technologies

      fields :created_at, :updated_at do
        label do
          "#{label} (timestamp)"
        end
      end

      configure :project_attachments do
        hide
      end
    end
  end

  config.model 'Service' do
    edit do
      field :name
      field :slug
      field :subtitle
      field :position
      field :image
      field :description
      field :short_description
      field :image

      field :projects
    end
  end
end

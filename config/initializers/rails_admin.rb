RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # # == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.parent_controller = "ApplicationController"

  config.model("Student") do
    object_label_method do
      :nome
    end
  end

  config.model("Subject") do
    object_label_method do
      :nome
    end
  end

  config.model("User") do
    object_label_method do
      :nome
    end
    edit do
      field :subjects do
        visible false
      end
      include_all_fields
    end
  end
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

  config.model 'Subject' do
    field :user do
      associated_collection_scope do
        # bindings[:object] & bindings[:controller] are available, but not in scope's block!
        user = bindings[:object]
        Proc.new { |scope|
          scope = scope.where(status: :professor) if user.present?
        }
      end
    end
    field :nome
    field :dias_semana
    field :hora_inicio
    field :hora_termino
    field :capacidade

  end

end

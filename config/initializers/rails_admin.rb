RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == CancanCan ==
   config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model 'User' do
    navigation_icon 'icon-user'
  end

  config.model 'City' do
    navigation_icon 'icon-road'
  end

  config.model 'Testimonial' do
    navigation_icon 'icon-star'
  end

  config.model 'Type' do
    navigation_icon 'icon-tasks'
  end

  config.model 'District' do
    navigation_icon 'icon-flag'
  end

  config.model 'Comment' do
    navigation_icon 'icon-comment'
  end

  config.model 'Feature' do
    navigation_icon 'icon-bars'
  end

  config.model 'House' do
    navigation_icon 'icon-home'
  end

  config.model 'Like' do
    navigation_icon 'icon-thumbs-up'
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
end

require 'i18n'
I18n.default_locale = :'zh-CN'

RailsAdmin.config do |config|

  config.authorize_with do
    authenticate_user!
    redirect_to main_app.root_path unless current_user.has_role? :admin
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

   config.model Page do    
     edit do
       field :slug
       field :title     
       field :content, :text do
         partial 'form_redactor'   
       end
       field :created_at
       field :updated_at
     end
   end

   config.model Chapter do    
     edit do
       field :number
       field :name     
       field :content, :text do
         partial 'form_redactor'   
       end
       field :keywords
       field :novel_id
       field :created_at
       field :updated_at
       field :status
     end
   end

end

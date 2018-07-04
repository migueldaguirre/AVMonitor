class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "Acceso denegado"
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def configure_permitted_parameters
    attributes = [:name, :cc,:role, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end


end

# USAGE
# PROTECT registros
# rails g pundit:policy registros
# # => generates the file `app/policies/registros_policy.rb`
# Question: Who can create a registros?

# ADMIN USERS
# rails g migration AddAdminToUsers admin:boolean
# rails db:migrate
# rails c
# pry> user = User.where(email: 'seb@lewagon.org').first
# pry> user.admin = true
# pry> user.save
# You can now use this admin field in your policies!

# HAPPY AUTHORIZING!

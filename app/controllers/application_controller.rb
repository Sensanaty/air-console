class ApplicationController < ActionController::Base

# Uncomment these lines once ready to use
before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: [:index, :overview], unless: :skip_pundit?



private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/ || params[:controller] == 'pages' || params[:controller] == 'rentals' || params[:controller] == 'reviews' || || params[:controller] == 'users'
  end

end

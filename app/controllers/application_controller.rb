class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_filter :complete_profile

   def complete_profile
      if user_signed_in?
        unless current_user.profile.email? && current_user.profile.full_name?
          redirect_to '/profile'
        end
      end
    end
end

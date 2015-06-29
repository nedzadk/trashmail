class ProfileController < ApplicationController
  skip_before_filter :complete_profile
  def index
    @profile = current_user.profile
  end
  
  def update
    @profile = current_user.profile
    @profile.update_attributes(params[:profile])
    if @profile.save 
      redirect_to '/messages/inbox'
    else
      redirect_to '/profile'
    end
  end

end

class ProfileController < ApplicationController
  def index
    @profile = current_user.profile
  end
  
  def update
    @profile = current_user.profile
    @profile.update_attributes(params[:profile])
    if @profile.save 
      redirect_to :controller=>'home', :action=>'index'
    else
      redirect_to '/profile'
    end
  end

end

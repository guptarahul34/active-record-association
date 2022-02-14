class HomeController < ApplicationController
  def index
  end

  def user_profile
      @user_profile = Event.all.where(user_id:current_user.id)
  end

end

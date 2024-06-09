class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def profile_update
   @user = current_user
  end

end

class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user
    if @user.update(params.require(:user).permit(:name, :introduction, :profilepic))
      redirect_to users_profile_path
    else
      render users_profile_edit_path
    end
  end
end

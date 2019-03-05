class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update_attribute(:username, user_params[:username])

  #   redirect_to user_path
  # end

  # private

  #   def user_params
  #     params.require(:user).permit(:username)
  #   end

end

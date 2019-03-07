class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    users_scores = @users.map do |user|
      if user.points
        user.points
      else
        0
      end
    end
    @ordered_users_scores = users_scores.sort.reverse
    @user_points = @user.events.count + @user.event_participants.count
    @rank = @ordered_users_scores.index(@user_points)
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

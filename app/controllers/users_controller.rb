class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render 'users/show'
  end
end

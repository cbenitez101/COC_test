class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy]
 before_action :authenticate, only: [:edit,:update]
 def new
   @user = User.new
 end
 def create
   @user = User.new(user_params)
   if @user.save
      redirect_to root_path, notice: 'User successfully added'
   else
      render action: :new
   end
 end
 def edit   
 end

 private
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

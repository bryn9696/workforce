class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created."
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = "User updated."
      redirect_to organisations_path
    else
      render 'edit'
    end
  end
 private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :organisation_id)
  end
end
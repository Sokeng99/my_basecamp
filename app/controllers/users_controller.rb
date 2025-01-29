class UsersController < ApplicationController
  layout :determine_layout

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to projects_home_path, notice: "User was successfully created."
    else
      render :new, alert: "Error creating user."
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.now[:notice] = "User was successfully updated."
      render :edit
    else
      flash.now[:alert] = "Error updating user."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "User was successfully deleted."
  end

  def determine_layout
    action_name == "edit" ? "home" : "application"
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

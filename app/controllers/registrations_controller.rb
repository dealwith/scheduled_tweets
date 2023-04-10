# frozen_string_literal: true

# This RegistrationController is responsible for creating a new user
# and saving it to the database. It also handles the rendering of the
# registration form.

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account!'
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

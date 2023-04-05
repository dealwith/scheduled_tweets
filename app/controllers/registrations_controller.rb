# frozen_string_literal: true

# This RegistrationController is responsible for creating a new user
# and saving it to the database. It also handles the rendering of the
# registration form.

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
end

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create, :destroy ]
  def new
    # Display the login form
  end

  def create
    # Find or create the user based on the username
    user = User.find_or_create_by(username: params[:username])

    # Store the user's ID in the session to keep them logged in
    session[:user_id] = user.id

    # Redirect to the root path
    redirect_to root_path, notice: "Logged in as #{user.username}"
  end

  def destroy
    # Log out the user by clearing the session
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end
end

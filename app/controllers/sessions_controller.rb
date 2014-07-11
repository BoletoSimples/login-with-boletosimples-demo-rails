class SessionsController < ApplicationController
  def create
    user = User.find_or_create_with_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to '/demo/logged_in'
  end

  def failure
    @omniauth_error = env['omniauth.error']
  end

  def show
    @user = User.find_by_id(session[:user_id])
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end

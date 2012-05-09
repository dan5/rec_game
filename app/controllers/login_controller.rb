class LoginController < ApplicationController
  def login
    @user = User.find_by_login params[:login]
    session[:user_id] = @user.id
  rescue
    render :text => 'Login failed'
  end
end

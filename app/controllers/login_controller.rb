class LoginController < ApplicationController
  def login
    @user = User.find_by_login params[:login]
    session[:user_id] = @user.id
    redirect_to results_url
  rescue
    render :text => 'Login failed'
  end
end

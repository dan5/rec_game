# -*- encoding: utf-8 -*-

class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from User::UnAuthorized, :with => -> { render :text => 'ログインしていません.' }

  before_filter { user }

  private

  def user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  def login_required
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    else
      raise User::UnAuthorized
    end
  end
end

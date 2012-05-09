# -*- encoding: utf-8 -*-

class UsersController < ApplicationController
  include LoginHelper

  def logout
    session[:user_id] = nil
    redirect_to users_url
  end

  def index
    @users = User.all
  end

  def show
    @current_user = User.find(params[:id])
    @categorys = @current_user.categorys
    @category = params[:category] || @categorys.first
    @results = @current_user.category_results(@category)
  end

  def new
    @new_user = User.new
  end

  def edit
    login_required
    raise User::UnAuthorized unless @user == User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.login = rand(1000000000000).to_s(36)
    # 本当はここに日本語メッセージを書くのは良くない
    @user.categorys_text = "高学年\n中学年\n低学年"
    if @user.save
      redirect_to login_url, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    login_required
    if @user.update_attributes(params[:user])
      redirect_to login_url, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    login_required
    raise User::UnAuthorized unless @user == User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end
end

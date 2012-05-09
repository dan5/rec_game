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
    @categorys = %w(L LL SL)
    @category = params[:category] || session[:category] || @categorys.first
    @results = @current_user.results.where(:category => @category)
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
    @user.destroy

    redirect_to users_url
  end
end

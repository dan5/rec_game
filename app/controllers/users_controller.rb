class UsersController < ApplicationController
  def login
    @user = User.find_by_login params[:login]
    session[:user_id] = @user.id
    redirect_to results_url
  end

  def logout
    session[:user_id] = nil
    redirect_to users_url
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    login_required
  end

  def create
    @user = User.new(params[:user])
    @user.login = rand(1000000000000).to_s(36)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    login_required
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
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

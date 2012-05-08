class ResultsController < ApplicationController
  before_filter {
    @user = User.find(session[:user_id])
  }

  def index
    @categorys = %w(L LL SL)
    @category = params[:category] || session[:category] || @categorys.first
    @results = @user.results.where(:category => @category)

    session[:category] = @category
  end

  def show
    @result = @user.results.find(params[:id])
  end

  def new
    @result = @user.results.new
    @result.category = session[:category]
  end

  def edit
    @result = @user.results.find(params[:id])
  end

  def create
    @result = @user.results.new(params[:result])

    if @result.save
      redirect_to @result, notice: 'Result was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @result = @user.results.find(params[:id])

    if @result.update_attributes(params[:result])
      redirect_to @result, notice: 'Result was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @result = @user.results.find(params[:id])
    @result.destroy

    redirect_to results_url
  end
end

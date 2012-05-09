class ResultsController < ApplicationController
  before_filter { user }
  before_filter { login_required }

  def index
    @categorys = @user.categorys
    @category = params[:category] || session[:category] || @categorys.first
    @results = @user.category_results(@category)

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
      redirect_to results_url, notice: 'Result was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @result = @user.results.find(params[:id])

    if @result.update_attributes(params[:result])
      redirect_to results_url, notice: 'Result was successfully updated.'
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

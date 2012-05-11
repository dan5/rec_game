class ResultsController < ApplicationController
  before_filter { user }
  before_filter { login_required }
  after_filter {
    session[:category] = @category
  }

  def index
    @category = params[:category] if params[:category]
    @categorys = @user.categorys
    @results = @user.category_results(@category)
  end

  def show
    @result = @user.results.find(params[:id])
  end

  def new
    @result = @user.results.new
    @result.category = @category
    if last = @user.results.find_by_category(@category)
      @result.competition = last.competition
      @result.place = last.place
    end
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

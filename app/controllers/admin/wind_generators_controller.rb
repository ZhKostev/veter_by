class Admin::WindGeneratorsController < Admin::ApplicationController
  before_filter :find_resource_or_404, :only => [:edit, :show, :destroy, :update]

  def index
    @wind_generators = WindGenerator.all
  end

  def show
  end

  def new
    @wind_generator = WindGenerator.new
  end

  def edit
  end

  def create
    @wind_generator = WindGenerator.new(params[:wind_generator])
    if @wind_generator.save
      redirect_to admin_wind_generators_url(@wind_generator), notice: 'Wind generator was successfully created.'
    else
      render action: new
    end
  end

  def update
    if @wind_generator.update_attributes(params[:wind_generator])
      redirect_to admin_wind_generators_url(@wind_generator), notice: 'Wind generator was successfully updated.'
    else
      render action: edit
    end
  end

  def destroy
    @wind_generator.destroy
    redirect_to admin_wind_generators_url
  end
end

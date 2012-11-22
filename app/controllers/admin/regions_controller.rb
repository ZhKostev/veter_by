class Admin::RegionsController < Admin::BaseController
  before_filter :find_resource_or_404, :only => [:edit, :show, :destroy, :update]

  def index
    @regions = Region.page params[:page]
  end

  def show
  end

  def new
    @region = Region.new
  end

  def edit
  end

  def create
    @region = Region.new(params[:region])

    if @region.save
      redirect_to admin_region_path(@region), notice: 'Region was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @region.update_attributes(params[:region])
      redirect_to admin_region_path(@region), notice: 'Region was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @region.destroy
    redirect_to admin_regions_url
  end
end

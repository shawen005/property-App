class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /listings
  def index
    @listings = Listing.all

    @new = Listing.rand.eight
    

  end

  # GET /listings/1
  def show

    @new = Listing.rand.eight

    
    @latest = Listing.recent.latest
    
    

  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @listing_image = @listing.listing_images.build
    
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
       params[:listing_images]['img'].each do |a|
          @listing_image = @listing.listing_images.create!(:img => a,     :listing_id => @listing.id)
       end
      redirect_to '/property', notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end
  def rent
    @rents = Listing.rent
    @latest = Listing.recent.latest
    @featured = Listing.rand.latest
  end

  def buy
    @buys = Listing.buy
    @latest = Listing.recent.latest
    @featured = Listing.rand.latest
  end

  def property
    @personal =  current_user
    
    @records = @personal.listings.all if @personal

    @personal ||= current_user



  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.permit(:title, :price, :description, :location, :status, :bed, :bath, :area, :garage, :address,listing_images_attributes: 
  [:id, :post_id, :img])
    end
end

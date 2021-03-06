class Admins::AuctionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @resources = current_admin.auctions
  end

  def show
  end

  def new
    @resource = Auction.new
  end

  def create
    @auction = current_admin.auctions.new(auction_params)
    if @auction.save!
      redirect_to admins_auction_auction_pictures_path(auction_id: @auction.id)
    else
      render :new
    end
  end

  def edit
    @auction = current_admin.auctions.find(params[:id])
  end

  def update
    auction = current_admin.auctions.find(params[:id])
    auction.update(auction_params)
    if auction.save!
      redirect_to admins_auction_auction_pictures_path(auction_id: auction.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def auction_params
    params.require(:auction).permit([:title, :description, :important_notices, :start_date, :end_date, :opening_bid, :modality,
      :postal_code, :street_address, :street_number, :neighborhood, :city, :state, :country])
  end
end

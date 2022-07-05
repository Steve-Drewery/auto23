class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy place_order]
  before_action :set_form_vars
  before_action :authenticate_user!, except: [:index]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @listing.title,
        amount: (@listing.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          user_id: @current_user.id
        }
      },
      success_url: "#{root_url}orders/success?eventId=#{@listing.id}",
      cancel_url: "#{root_url}listings/#{@listing.id}"
    )
    @session_id = session.id
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_form_vars
    @categories = Category.all
    @conditions = Listing.conditions.keys
  end

  def place_order
    Order.create(
      listing_id: @listing.id,
      seller_id: @listing.user.id,
      buyer_id: current_user.id
    )
    @listing.update(sold: true)
  end

  def search
    @listings = Listing.where("title LIKE ?", "%" + params[:q] + "%")
  end

  def category
    @listings = Listing.where("category_id LIKE ?", "%" + params[:q] + "%")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :description, :condition, :price, :sold, :user_id, :category_id, :picture)
    end
end

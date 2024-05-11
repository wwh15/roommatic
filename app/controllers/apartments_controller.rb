class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show edit update destroy occupy vacate ]
  before_action :set_form_values, only: %i[ new edit create update ]

  # GET /apartments or /apartments.json
  def index
    @apartments = Apartment.all
  end

  # GET /apartments/1 or /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments or /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to apartment_url(@apartment), notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1 or /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to apartment_url(@apartment), notice: "Apartment was successfully updated." }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1 or /apartments/1.json
  def destroy
    @apartment.destroy!

    respond_to do |format|
      format.html { redirect_to apartments_url, notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def occupy
    current_user.apartment_id = @apartment.id
    if current_user.save
      redirect_to apartment_url(@apartment), notice: "Apartment was successfully occupied."
    else
      puts current_user.errors.full_messages
      render :show, status: :unprocessable_entity
    end
  end

  def vacate
    current_user.apartment_id = nil
    if current_user.save
      redirect_to apartment_url(@apartment), notice: "Apartment was successfully vacated."
    else
      puts current_user.errors.full_messages
      render :show, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
      @pending_applications = @apartment.apartment_requests.where(status: :pending).includes(:applicant => :profile)
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:street_address, :bedrooms, :rent, :notes, :neighborhood_id, :city_id)
    end

    def set_form_values
      @cities = City.all
      @neighborhoods = Neighborhood.all
    end


end

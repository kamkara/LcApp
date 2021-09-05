class CityAreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_city_area, only: %i[ show edit update destroy ]

  # GET /city_areas or /city_areas.json
  def index
    @city_areas = CityArea.all
  end

  # GET /city_areas/1 or /city_areas/1.json
  def show
  end

  # GET /city_areas/new
  def new
    @city_area = CityArea.new
  end

  # GET /city_areas/1/edit
  def edit
  end

  # POST /city_areas or /city_areas.json
  def create
    @city_area = current_user.cityAreas.build(city_area_params)

    respond_to do |format|
      if @city_area.save
        format.html { redirect_to @city_area, notice: "City area was successfully created." }
        format.json { render :show, status: :created, location: @city_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_areas/1 or /city_areas/1.json
  def update
    respond_to do |format|
      if @city_area.update(city_area_params)
        format.html { redirect_to @city_area, notice: "City area was successfully updated." }
        format.json { render :show, status: :ok, location: @city_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_areas/1 or /city_areas/1.json
  def destroy
    @city_area.destroy
    respond_to do |format|
      format.html { redirect_to city_areas_url, notice: "City area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_area
      @city_area = CityArea.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_area_params
      params.require(:city_area).permit(:title, :slug, :user_id)
    end
end

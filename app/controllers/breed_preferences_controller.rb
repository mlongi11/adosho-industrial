class BreedPreferencesController < ApplicationController
  before_action :set_breed_preference, only: %i[ show edit update destroy ]

  # GET /breed_preferences or /breed_preferences.json
  def index
    @breed_preferences = BreedPreference.all
  end

  # GET /breed_preferences/1 or /breed_preferences/1.json
  def show
  end

  # GET /breed_preferences/new
  def new
    @breed_preference = BreedPreference.new
  end

  # GET /breed_preferences/1/edit
  def edit
  end

  # POST /breed_preferences or /breed_preferences.json
  def create
    @breed_preference = BreedPreference.new(breed_preference_params)

    respond_to do |format|
      if @breed_preference.save
        format.html { redirect_to breed_preference_url(@breed_preference), notice: "Breed preference was successfully created." }
        format.json { render :show, status: :created, location: @breed_preference }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @breed_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breed_preferences/1 or /breed_preferences/1.json
  def update
    respond_to do |format|
      if @breed_preference.update(breed_preference_params)
        format.html { redirect_to breed_preference_url(@breed_preference), notice: "Breed preference was successfully updated." }
        format.json { render :show, status: :ok, location: @breed_preference }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @breed_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breed_preferences/1 or /breed_preferences/1.json
  def destroy
    @breed_preference.destroy

    respond_to do |format|
      format.html { redirect_to breed_preferences_url, notice: "Breed preference was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breed_preference
      @breed_preference = BreedPreference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def breed_preference_params
      params.require(:breed_preference).permit(:user_id, :breed_id)
    end
end

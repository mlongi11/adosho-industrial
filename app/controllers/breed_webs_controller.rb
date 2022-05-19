class BreedWebsController < ApplicationController
  before_action :set_breed_web, only: %i[ show edit update destroy ]

  # GET /breed_webs or /breed_webs.json
  def index
    @breed_webs = BreedWeb.all
  end

  # GET /breed_webs/1 or /breed_webs/1.json
  def show
  end

  # GET /breed_webs/new
  def new
    @breed_web = BreedWeb.new
  end

  # GET /breed_webs/1/edit
  def edit
  end

  # POST /breed_webs or /breed_webs.json
  def create
    @breed_web = BreedWeb.new(breed_web_params)

    respond_to do |format|
      if @breed_web.save
        format.html { redirect_to breed_web_url(@breed_web), notice: "Breed web was successfully created." }
        format.json { render :show, status: :created, location: @breed_web }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @breed_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breed_webs/1 or /breed_webs/1.json
  def update
    respond_to do |format|
      if @breed_web.update(breed_web_params)
        format.html { redirect_to breed_web_url(@breed_web), notice: "Breed web was successfully updated." }
        format.json { render :show, status: :ok, location: @breed_web }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @breed_web.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breed_webs/1 or /breed_webs/1.json
  def destroy
    @breed_web.destroy

    respond_to do |format|
      format.html { redirect_to breed_webs_url, notice: "Breed web was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breed_web
      @breed_web = BreedWeb.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def breed_web_params
      params.require(:breed_web).permit(:primary_breed_id, :similar_breed_id)
    end
end

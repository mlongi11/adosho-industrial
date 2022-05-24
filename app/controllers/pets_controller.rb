class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
    url = "https://www.pawschicago.org/our-work/pets-adoption/pets-available"
    webpage = HTTP.get(url)
    parsed_page = Nokogiri::HTML(webpage.body.to_s)
    @links = parsed_page.css('.adopt-pet a')

    @content = @links.match(/<a href="\/pet-available-for-adoption\/.\/.">/)[1]
    
    # @links.each do |link|
    #   if link.content.include?('<a href="/pet-available-for-adoption/')
    #     @content.push(link)
    #   end
    # end

  end

  def scrape
    url = "https://www.pawschicago.org/our-work/pets-adoption/pets-available"
    webpage = HTTP.get(url)
    parsed_page = Nokogiri::HTML(webpage.body.to_s)
    @links = parsed_page.css('<a href="/pet-available-for-adoption/')

  end

  # GET /pets/1 or /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_url(@pet), notice: "Pet was successfully created." }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: "Pet was successfully updated." }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url, notice: "Pet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :estimated_birthday, :status, :adopter_id, :gender, :weight, :children_competability_ranking, :dog_competability_ranking, :cat_competability_ranking, :home_alone_competability_ranking, :activity_competability_ranking, :notes, :species, :picture, :human_socialability_competability_ranking, :enrichment_competability_ranking, :adoption_center_identifier, :pictures_count)
    end
end

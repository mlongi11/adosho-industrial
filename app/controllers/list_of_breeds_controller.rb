class ListOfBreedsController < ApplicationController
  before_action :set_list_of_breed, only: %i[ show edit update destroy ]

  # GET /list_of_breeds or /list_of_breeds.json
  def index
    @list_of_breeds = ListOfBreed.all
  end

  # GET /list_of_breeds/1 or /list_of_breeds/1.json
  def show
  end

  # GET /list_of_breeds/new
  def new
    @list_of_breed = ListOfBreed.new
  end

  # GET /list_of_breeds/1/edit
  def edit
  end

  # POST /list_of_breeds or /list_of_breeds.json
  def create
    @list_of_breed = ListOfBreed.new(list_of_breed_params)

    respond_to do |format|
      if @list_of_breed.save
        format.html { redirect_to list_of_breed_url(@list_of_breed), notice: "List of breed was successfully created." }
        format.json { render :show, status: :created, location: @list_of_breed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_of_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_of_breeds/1 or /list_of_breeds/1.json
  def update
    respond_to do |format|
      if @list_of_breed.update(list_of_breed_params)
        format.html { redirect_to list_of_breed_url(@list_of_breed), notice: "List of breed was successfully updated." }
        format.json { render :show, status: :ok, location: @list_of_breed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_of_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_of_breeds/1 or /list_of_breeds/1.json
  def destroy
    @list_of_breed.destroy

    respond_to do |format|
      format.html { redirect_to list_of_breeds_url, notice: "List of breed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_of_breed
      @list_of_breed = ListOfBreed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_of_breed_params
      params.require(:list_of_breed).permit(:breed_name, :species)
    end
end

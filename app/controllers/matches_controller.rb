class MatchesController < ApplicationController
  # before_action :set_match, only: %i[ show edit update destroy ]

  # GET /matches or /matches.json
  def index
  end

  def refresh_matches
    # Clear users matches
    Match.where(user_id: current_user.id).all.destroy_all
    
    pets = Pet.all

    unless current_user.interest.nil?
      pets.each do |pet|
        match_strength = 0
        if pet.children_competability_ranking.nil? then match_strength = match_strength elsif pet.children_competability_ranking >= current_user.interest.children_competability_preference
          match_strength = match_strength + 15
          else match_strength = match_strength
        end
        if pet.dog_competability_ranking.nil? then match_strength = match_strength elsif pet.dog_competability_ranking >= current_user.interest.dog_competability_preference
          match_strength = match_strength + 15
          else match_strength = match_strength
        end
        if pet.cat_competability_ranking.nil? then match_strength = match_strength  elsif pet.cat_competability_ranking >= current_user.interest.cat_competability_preference
          match_strength = match_strength + 15
          else match_strength = match_strength
        end
        if pet.home_alone_competability_ranking.nil? then match_strength = match_strength  elsif pet.home_alone_competability_ranking >= current_user.interest.home_alone_competability_preference
          match_strength = match_strength + 15
          else match_strength = match_strength
        end
        if pet.activity_competability_ranking.nil? then match_strength = match_strength  elsif pet.activity_competability_ranking >= current_user.interest.activity_competability_preference
          match_strength = match_strength + 15
          else match_strength = match_strength
        end
        if pet.human_socialability_competability_ranking.nil? then match_strength = match_strength  elsif pet.human_socialability_competability_ranking >= current_user.interest.human_sociability_competability_preference
          match_strength = match_strength + 15
          else match_strength = match_strength
        end
        if pet.status.nil? then match_strength = match_strength  elsif pet.status.downcase.include?("adopt") && current_user.interest.interested_in_adopting_dogs == false && pet.species == "Dog"
          match_strength = 0
          else match_strength = match_strength 
        end
        if pet.status.nil? then match_strength = match_strength elsif pet.status.downcase.include?("adopt") && current_user.interest.interested_in_adopting_cats == false && pet.species == "Cat"
          match_strength = 0
          else match_strength = match_strength
        end
        if pet.status.nil? then match_strength = match_strength elsif pet.status.downcase.include?("foster") && current_user.interest.interested_in_fostering_dogs == false && pet.species == "Dog"
          match_strength = 0
          else match_strength = match_strength
        end
        if pet.status.nil? then match_strength = match_strength elsif pet.status.downcase.include?("foster") && current_user.interest.interested_in_fostering_cats == false && pet.species == "Cat"
          match_strength = 0
          else match_strength = match_strength
        end
        if match_strength > 50
          match = Match.create(pet_id: pet.id, user_id: current_user.id, match_strength: match_strength)
          if match.valid?
            match.save
          end
        end
      end
    end

    redirect_to("/matches", { :notice => "Matches updated successfully." })
  end

  # GET /matches/1 or /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches or /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to match_url(@match), notice: "Match was successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:pet_id, :user_id, :match_strength)
    end
end

json.extract! pet, :id, :name, :estimated_birthday, :status, :adopter_id, :gender, :weight, :children_competability_ranking, :dog_competability_ranking, :cat_competability_ranking, :home_alone_competability_ranking, :activity_competability_ranking, :notes, :picture, :human_socialability_competability_ranking, :enrichment_competability_ranking, :adoption_center_identifier, :created_at, :updated_at
json.url pet_url(pet, format: :json)

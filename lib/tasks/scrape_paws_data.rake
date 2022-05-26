task({ :scrape_paws_data => :environment}) do
  Pet.destroy_all

  url = "https://www.pawschicago.org/our-work/pets-adoption/pets-available"
  webpage = HTTP.get(url)
  parsed_page = Nokogiri::HTML(webpage.body.to_s)
  pet_links = parsed_page.css('.adopt-pet a')

  links = []
    
  pet_links.each do |pet_link|
    links.push(pet_link.attributes.fetch("href").to_s)
  end

  links.each do |link|
    pet_url = "https://www.pawschicago.org#{link}"
    pet_webpage = HTTP.get(pet_url)
    pet_parsed_page = Nokogiri::HTML(pet_webpage.body.to_s)

    pet = Pet.new
    pet.name = pet_parsed_page.css('.aqua-text').children.to_s
    pet.adoption_center_identifier = link
    pet.children_competability_ranking = if pet_parsed_page.css('.children .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.children .rating_default').children.to_s == ""
        then nil 
        else pet_parsed_page.css('.children .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.activity_competability_ranking = if pet_parsed_page.css('.activity .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.activity .rating_default').children.to_s == "" 
        then nil 
        else pet_parsed_page.css('.activity .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.cat_competability_ranking = if pet_parsed_page.css('.cats .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.cats .rating_default').children.to_s == ""
       then nil 
       else pet_parsed_page.css('.cats .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.dog_competability_ranking = if pet_parsed_page.css('.dogs .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.dogs .rating_default').children.to_s == "" 
       then nil 
       else pet_parsed_page.css('.dogs .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.enrichment_competability_ranking = if pet_parsed_page.css('.enrichment .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.enrichment .rating_default').children.to_s == ""
       then nil 
       else pet_parsed_page.css('.enrichment .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.home_alone_competability_ranking = if pet_parsed_page.css('.home_alone .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.home_alone .rating_default').children.to_s == ""
       then nil 
       else pet_parsed_page.css('.home_alone .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.human_socialability_competability_ranking = if pet_parsed_page.css('.human .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.human .rating_default').children.to_s == "" 
       then nil 
       else pet_parsed_page.css('.human .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.species = if link.include? "dog" then "Dog" else "Cat" end
    pet.save 
    # create picture and tie to pet
    picture = Picture.new
      img_url = pet_parsed_page.css('.lazyOwl').to_s.scan(/datasrc=.*\".*\"/)
      img_url = img_url.to_s.scan(/https:.*jpg/).first
      picture.image = img_url
      picture.pet_id = pet.id 
    picture.save
    p "Created #{pet.name}"
  end

      # still need to pull
      #  estimated_birthday                        :date
      #  gender                                    :string
      #  name                                      :string
      #  notes                                     :text
      #  picture                                   :string
      #  pictures_count                            :integer
      #  status                                    :string
      #  weight                                    :float
end
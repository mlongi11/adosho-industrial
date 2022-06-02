task({ :scrape_paws_data => :environment}) do

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


    pet = Pet.find_or_create_by(adoption_center_identifier: link)
    pet.name = pet_parsed_page.css('.aqua-text').children.to_s
    pet.adoption_center_identifier = link
    pet.children_competability_ranking = if pet_parsed_page.css('.children .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.children .rating_default').children.to_s == ""
         nil 
        else pet_parsed_page.css('.children .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.activity_competability_ranking = if pet_parsed_page.css('.activity .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.activity .rating_default').children.to_s == "" 
         nil 
        else pet_parsed_page.css('.activity .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.cat_competability_ranking = if pet_parsed_page.css('.cats .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.cats .rating_default').children.to_s == ""
        nil 
       else pet_parsed_page.css('.cats .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.dog_competability_ranking = if pet_parsed_page.css('.dogs .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.dogs .rating_default').children.to_s == "" 
        nil 
       else pet_parsed_page.css('.dogs .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.enrichment_competability_ranking = if pet_parsed_page.css('.enrichment .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.enrichment .rating_default').children.to_s == ""
        nil 
       else pet_parsed_page.css('.enrichment .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.home_alone_competability_ranking = if pet_parsed_page.css('.home_alone .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.home_alone .rating_default').children.to_s == ""
        nil 
       else pet_parsed_page.css('.home_alone .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.human_socialability_competability_ranking = if pet_parsed_page.css('.human .rating_default').children.to_s == "UNKNOWN" || pet_parsed_page.css('.human .rating_default').children.to_s == "" 
        nil 
       else pet_parsed_page.css('.human .rating_default').children.to_s.split("")[14].to_i 
      end
    pet.species = link.include?("dog") ? "Dog" : "Cat"
    pet.save 
    # create picture and tie to pet
    pet_parsed_page.css('.lazyOwl').each do |url|
      unless url.values.first.nil?
        img_url = url.values.first
        picture = Picture.find_or_create_by(image: img_url)
        pet.pictures.create(image: img_url)
      end
    end
    p "Created or updated #{pet.name}"
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
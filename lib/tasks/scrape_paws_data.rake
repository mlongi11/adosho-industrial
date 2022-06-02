task({ :scrape_paws_data => :environment}) do

  url = "https://www.pawschicago.org/our-work/pets-adoption/pets-available"
  webpage = HTTP.get(url)
  parsed_page = Nokogiri::HTML(webpage.body.to_s)
  pet_links = parsed_page.css('.adopt-pet a')

  links = []
    
  pet_links.each do |pet_link|
    links.push(pet_link.attributes.fetch("href").to_s)
  end

  links = links.uniq

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
    pet.gender = pet_parsed_page.css('.gender p').first.children.to_s
    weight_array = pet_parsed_page.css('.weight p').first.children.to_s.scan(/(\d+)/)
    pet.weight = "#{weight_array.first.first.to_i}.#{weight_array.last.first.to_i}".to_f
    pet.status = pet_parsed_page.css('#main td').first.children.to_s.strip
    pet.notes = pet_parsed_page.css('.copy-right p').first.children.to_s

    # find estimated birthday         
    age_number = pet_parsed_page.css('.age p').first.children.to_s.scan(/(\d+)/).first.first.to_f
    age_unit = pet_parsed_page.css('.age p').first.children.to_s.scan(/([[:alpha:]]+)/).first.first
    if age_unit == "Years" || age_unit == "Year"
      pet.estimated_birthday = Date.today - (365*age_number)
    elsif age_unit == "Months" || age_unit == "Month"
      pet.estimated_birthday = Date.today - (30*age_number)
    elsif age_unit == "Weeks" || age_unit == "Week"
      pet.estimated_birthday = Date.today - (7*age_number)
    end

    pet.save 
    # create picture and tie to pet
    pet_parsed_page.css('.lazyOwl').each do |url|
      unless url.values.first.nil?
        img_url = url.values.first
        pet.pictures.create(remote_image_url: img_url)
      end
    end
    p "Created or updated #{pet.name}"
  end

      # still need to pull
      #  estimated_birthday                        :date
  
end
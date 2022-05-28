task({ :test_delete => :environment}) do
  Pet.destroy_all
  Picture.destroy_all

  # url = "https://www.pawschicago.org/our-work/pets-adoption/pets-available"
  # webpage = HTTP.get(url)
  # parsed_page = Nokogiri::HTML(webpage.body.to_s)
  # pet_links = parsed_page.css('.adopt-pet a')

  # links = []
    
  # pet_links.each do |pet_link|
  #   links.push(pet_link.attributes.fetch("href").to_s)
  # end

  # Pet.all.each do |pet|
    
  # end

end
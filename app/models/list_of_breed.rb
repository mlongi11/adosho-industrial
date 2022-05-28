class ListOfBreed < ApplicationRecord

  enum species: { dog: "dog", cat: "cat" }
end

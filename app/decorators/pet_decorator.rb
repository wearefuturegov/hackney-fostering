class PetDecorator < MainDecorator
  delegate :pet_type,
           :size,
           :age,
           :where_allowed,
           :areas,
           :sleeping_area,
           :feeding_area,
           :temperament,
           :toilet,
           :children_experience
  
  def neutered
    value_from(pet.neutered)
  end
  
  def safe_around_food
    value_from(pet.safe_around_food)
  end
  
  def bitten_or_hurt
    value_from(pet.bitten_or_hurt)
  end
  
  def vet
    value_from(pet.vet)
  end
  
  def vaccination
    value_from(pet.vaccinations)
  end
  
  def bitten_or_hurt_detail
    pet.bitten_or_hurt_detail.blank? ? 'N/A' : pet.bitten_or_hurt_detail
  end
end

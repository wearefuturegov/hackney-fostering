Fabricator(:pet) do
  pet_type { FFaker::Lorem.word }
  size { Pet.sizes.values.sample }
  neutered { [true, false].sample }
  age { rand(1..18) }
  where_allowed { FFaker::Lorem.sentence }
  areas { FFaker::Lorem.sentence }
  sleeping_area { FFaker::Lorem.sentence }
  feeding_area { FFaker::Lorem.sentence }
  safe_around_food { [true, false].sample }
  temperament { FFaker::Lorem.sentence }
  toilet { FFaker::Lorem.sentence }
  bitten_or_hurt { [true, false].sample }
  bitten_or_hurt_detail { FFaker::Lorem.sentence }
  vet { [true, false].sample }
  vaccinations { [true, false].sample }
  children_experience { FFaker::Lorem.sentence }
  conflict { FFaker::Lorem.sentence }
  conflict_resolution { FFaker::Lorem.sentence }
  application { Fabricate(:application) }
end

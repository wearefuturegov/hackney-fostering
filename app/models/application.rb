class Application < ApplicationRecord
  extend ::FriendlyId
  friendly_id :code

  enum type_of_fostering: %i[emergency_fostering short_term_fostering long_term_fostering dont_know],
       spare_room: %i[yes no not_yet],
       experience: %i[very_experienced somewhat_experienced little_experience no_experience],
       housing_type: %i[own_property renting_council renting_private],
       other_ways: %i[mentoring specialist_support other_support],
       be_in_touch: %i[contact_me info_pack],
       contacting_you: %i[contact_phone contact_email contact_either],
       contact_phone_time: %i[morning afternoon evening],
       best_way_to_contact: %i[phone email],
       religion: %i[christian muslim hindu sikh jewish buddhist],
       primary_language: %i[english polish urdu bengali gujarati arabic french mandarin cantonese tamil turkish],
       employment_type: %i[full_time part_time self_employed director unemployed]
    
  has_many :applications_children
  has_many :applications_adults
  has_many :applications_children_elsewhere, class_name: 'ApplicationsChildElsewhere'
  has_many :applications_adults_elsewhere, class_name: 'ApplicationsAdultElsewhere'
  has_many :applications_referees, class_name: 'ApplicationsReferee'
         
  has_many :children, through: :applications_children, source: :person
  has_many :adults, through: :applications_adults, source: :person
  has_many :children_elsewhere, through: :applications_children_elsewhere, source: :person
  has_many :adults_elsewhere, through: :applications_adults_elsewhere, source: :person
  has_many :referees, through: :applications_referees, source: :person

  has_many :addresses
  has_many :pets
  
  belongs_to :applicant, class_name: 'Person', foreign_key: :applicant_id, optional: true
  belongs_to :address, class_name: 'Address', foreign_key: :address_id, optional: true
  belongs_to :support_carer, class_name: 'Person', foreign_key: :support_carer_id, optional: true
  
  belongs_to :agency_address, class_name: 'Address', foreign_key: :agency_address_id, optional: true
  belongs_to :other_agency_address, class_name: 'Address', foreign_key: :other_agency_address_id, optional: true
  belongs_to :previous_agency_address, class_name: 'Address', foreign_key: :previous_agency_address_id, optional: true

  accepts_nested_attributes_for(
    :children,
    :adults,
    :addresses,
    :pets,
    :applicant,
    :address,
    :agency_address,
    :other_agency_address,
    :previous_agency_address
  )
  
  validates :number_of_children, presence: true, if: :children_at_home?
  
  after_create :generate_code
  
  def reference_count(total, current)
    (total - (total - current) + 1).en.numwords.en.ordinal
  end
  
  def children_count
    reference_count number_of_children, children.count
  end
  
  def children_elsewhere_count
    reference_count number_of_children_elsewhere, children_elsewhere.count
  end
  
  def adults_count
    reference_count number_of_adults, adults.count
  end
  
  def adults_elsewhere_count
    reference_count number_of_adults_elsewhere, adults_elsewhere.count
  end
  
  def referees_count
    referees.count.en.numwords.en.ordinal
  end
  
  private
  
  def generate_code
    code = nil
    loop do
      code = Hashids.new(ENV['HASHID_SALT'], 6, 'ABCDEFG123456789').encode(id)
      break unless Application.where(code: code).exists?
    end
    update_attribute(:code, code)
  end
end

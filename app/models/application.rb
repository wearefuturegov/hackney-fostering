class Application < ApplicationRecord
  extend ::FriendlyId
  extend Memoist

  friendly_id :code

  enum spare_room: %i[yes no not_yet],
       experience: %i[very_experienced somewhat_experienced little_experience no_experience],
       housing_type: %i[own_property renting_council renting_private],
       other_ways: %i[mentoring specialist_support other_support],
       be_in_touch: %i[contact_me info_pack],
       contacting_you: %i[contact_phone contact_email],
       best_way_to_contact: %i[phone email],
       employment_type: %i[full_time part_time self_employed unemployed]

  has_many :children
  has_many :adults
  has_many :children_elsewhere, class_name: 'ChildElsewhere'
  has_many :adults_elsewhere, class_name: 'AdultElsewhere'
  has_many :referees

  has_many :addresses

  belongs_to :applicant, optional: true
  belongs_to :address, optional: true
  belongs_to :support_carer, optional: true

  belongs_to :agency_address, class_name: 'Address', foreign_key: :agency_address_id, optional: true
  belongs_to :other_agency_address, class_name: 'Address', foreign_key: :other_agency_address_id, optional: true
  belongs_to :previous_agency_address, class_name: 'Address', foreign_key: :previous_agency_address_id, optional: true

  # Validations for eligibility form
  validates :type_of_fostering, presence: true, if: -> { on_step?(%w[fostering_type]) }
  validates :spare_room, presence: true, if: -> { on_step?(%w[spare_room]) }
  validates :over_21, inclusion: [true, false], if: -> { on_step?(%w[over_21]) }
  validates :experience, presence: true, if: -> { on_step?(%w[experience]) }
  validates :age_experience, presence: true, if: -> { on_step?(%w[age_experience]) }
  validates :housing_type, presence: true, if: -> { on_step?(%w[housing_type]) }
  validates :be_in_touch, presence: true, if: -> { on_step?(%w[be_in_touch]) }
  validates :contacting_you, presence: true, if: -> { on_step?(%w[contacting_you]) }
  validates :phone_number, presence: true, if: -> { on_step?(%w[contact_phone]) }
  validates :contact_phone_time, presence: true, if: -> { on_step?(%w[contact_phone_time]) }

  # Validations for you and your family form
  validates :name_change, inclusion: [true, false], if: -> { on_step?(%w[name_change]) }
  validates :primary_language, presence: true, if: -> { on_step?(%w[language]) }
  validates :other_language, presence: true, if: -> { on_step?(%w[other_language]) }
  validates :secondary_languages, presence: true, if: -> { on_step?(%w[other_language_select]) }
  validates :religious, inclusion: [true, false], if: -> { on_step?(%w[are_you_religious]) }
  validates :religion, presence: true, if: -> { on_step?(%w[what_is_your_religion]) }
  validates :practicing, inclusion: [true, false], if: -> { on_step?(%w[are_you_practicing]) }
  validates :employment_type, presence: true, if: -> { on_step?(%w[employment_history]) }
  validates :occupation, presence: true, if: -> { on_step?(%w[occupation]) }
  validates :employer, presence: true, if: -> { on_step?(%w[name_of_employer]) }
  validates :employer_contact_name, presence: true, if: -> { on_step?(%w[name_of_employer_contact]) }
  validates :employer_phone_number, presence: true, if: -> { on_step?(%w[number_for_employer_contact]) }
  validates :address, presence: true, if: -> { on_step?(%w[full_address]) }
  validates :children_at_home, inclusion: [true, false], if: -> { on_step?(%w[children_living_at_home]) }
  validates :children_living_elsewhere, inclusion: [true, false], if: -> { on_step?(%w[children_living_elsewhere]) }
  validates :adults_living_at_home, inclusion: [true, false], if: -> { on_step?(%w[adults_living_at_home]) }
  validates :adults_living_elsewhere, inclusion: [true, false], if: -> { on_step?(%w[adults_living_elsewhere]) }
  validates :have_pets, inclusion: [true, false], if: -> { on_step?(%w[pets]) }
  validates :number_of_pets, presence: true, if: -> { on_step?(%w[pets]) }
  validates :pet_type, presence: true, if: -> { on_step?(%w[pets]) && have_pets == true }
  validates :family_court, inclusion: [true, false], if: -> { on_step?(%w[family_court]) }
  validates :court_date, presence: true, if: -> { on_step?(%w[court_date]) }
  validates :court_name, presence: true, if: -> { on_step?(%w[court_name]) }
  validates :type_of_order, presence: true, if: -> { on_step?(%w[type_of_order]) }
  validates :parties_involved, presence: true, if: -> { on_step?(%w[parties_involved]) }
  validates :court_details, presence: true, if: -> { on_step?(%w[court_details]) }
  validates :previous_applications, inclusion: [true, false], if: -> { on_step?(%w[previous_applications]) }
  validates :application_date, presence: true, if: -> { on_step?(%w[application_date]) }
  validates :agency_name, presence: true, if: -> { on_step?(%w[agency_name]) }
  validates :type_of_application, presence: true, if: -> { on_step?(%w[type_of_application]) }
  validates :application_outcome, presence: true, if: -> { on_step?(%w[application_outcome]) }
  validates :other_previous_applications, inclusion: [true, false], if: -> { on_step?(%w[other_previous_applications]) }
  validates :other_application_date, presence: true, if: -> { on_step?(%w[other_application_date]) }
  validates :other_agency_name, presence: true, if: -> { on_step?(%w[other_agency_name]) }
  validates :other_type_of_application, presence: true, if: -> { on_step?(%w[other_type_of_application]) }
  validates :other_application_outcome, presence: true, if: -> { on_step?(%w[other_application_outcome]) }
  validates :previous_fostering, inclusion: [true, false], if: -> { on_step?(%w[previous_fostering]) }
  validates :previous_agency_name, presence: true, if: -> { on_step?(%w[previous_agency_name]) }
  
  validates :agree_to_checks, presence: true, if: -> { on_step?(%w[consent]) }
  validates :agree_to_la_contact, presence: true, if: -> { on_step?(%w[consent]) }

  accepts_nested_attributes_for(
    :children,
    :adults,
    :addresses,
    :applicant,
    :address,
    :agency_address,
    :other_agency_address,
    :previous_agency_address,
    :support_carer,
    update_only: true
  )

  after_create :generate_code

  def on_step?(steps)
    steps.include?(current_step)
  end

  def send_full_application_email!
    ApplicationsMailer.application(id).deliver
  end

  def about_you_complete?
    religious == true && religion.present? || religious == false
  end
  memoize :about_you_complete?

  def working_experience_complete?
    unemployed? || employer_phone_number.present?
  end
  memoize :working_experience_complete?

  def address_history_complete?
    address&.years_ago.to_i >= 5 || (address&.years_ago.to_i + addresses.sum(&:years_ago) >= 5)
  end
  memoize :address_history_complete?

  def family_complete?
    adults_living_elsewhere == false || adults_living_elsewhere == true && adults_elsewhere.count.positive?
  end
  memoize :family_complete?

  def pets_complete?
    have_pets == false || have_pets == true && pet_type.present?
  end
  memoize :pets_complete?

  def you_and_your_family_complete?
    about_you_complete? && working_experience_complete? && address_history_complete? && family_complete? && pets_complete?
  end

  def support_carer_complete?
    support_carer&.email.present?
  end

  def references_complete?
    referees.count == 6
  end

  def legal_history_complete?
    previous_fostering == false || previous_fostering == true && previous_agency_address.present?
  end

  def all_application_complete?
    you_and_your_family_complete? && support_carer_complete? && references_complete? && legal_history_complete?
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

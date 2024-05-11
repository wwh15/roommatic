class Apartment < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :city
  has_many :residents, class_name: "User"
  has_many :apartment_requests, dependent: :destroy
  has_many :applicants, through: :apartment_requests, source: :applicant

  validates :street_address, presence: true
  validates :bedrooms, numericality: { greater_than_or_equal_to: 1 }
  validates :rent, numericality: { greater_than: 100 }
  

  def remaining_bedrooms
    bedrooms - residents.count
  end

  def unoccupied?
    if residents.count == 0
      return true
    else
      return false
    end
  end

  def current_resident?(user)
    residents.exists?(user.id)
  end

  def request(applicant)
    applicant.apartment_requests.where(apartment_id: self.id).first
  end

  def requested?(applicant)
    request(applicant)&.present?
  end

  def request_pending?(applicant)
    request(applicant)&.pending?
  end

  def can_apply?(applicant)
    !requested?(applicant) && !unoccupied? && !current_resident?(applicant)
  end


  
end

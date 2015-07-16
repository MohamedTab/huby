class Restaurant < ActiveRecord::Base
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

   def self.search(search)
    where('address iLIKE ?', "%#{search}%")
  end
end

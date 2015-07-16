class Restaurant < ActiveRecord::Base
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attached_file :picture,
    styles: { medium: "250x250>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

   def self.search(search)
    where('address iLIKE ?', "%#{search}%")
  end

end

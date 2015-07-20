class Restaurant < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  has_many :restaurant_pictures, :dependent => :destroy
  has_many :reviews, :dependent => :destroy


  accepts_nested_attributes_for :restaurant_pictures

  geocoded_by :address
  after_validation :geocode, if: :address_changed?



   def self.search(search)
    where('address iLIKE ?', "%#{search}%")
  end

end


 # has_attached_file :picture,
 #    styles: { medium: "250x250>", thumb: "100x100>" }

 #  validates_attachment_content_type :picture,
 #    content_type: /\Aimage\/.*\z/
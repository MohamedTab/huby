class Restaurant < ActiveRecord::Base
  belongs_to :user

   def self.search(search)
    where('locality iLIKE ?', "%#{search}%")
  end
end

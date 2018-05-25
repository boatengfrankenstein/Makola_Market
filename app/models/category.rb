class Category < ApplicationRecord
	  has_many :classifieds 
 def self.search(term)
	 where('LOWER(name) LIKE :term ', term: "%#{term.downcase}%")
 end
end

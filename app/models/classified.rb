class Classified < ApplicationRecord
validates_presence_of :title 
    validates_presence_of :price 
    validates_presence_of :location 
    validates_presence_of :description 
    validates_presence_of :email 
    validates_numericality_of :price 
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    
    belongs_to :category 
    
  protected 
    def validate 
      errors.add(:price, "should be a positive value") if price.nil? || price < 0.01 
    end 
  end
class Listing < ApplicationRecord
	has_many :listing_images
	belongs_to :user
    accepts_nested_attributes_for :listing_images



def self.special_blogs
    all
end

def self.featured_blogs
    limit(4)
end

def self.latest
    limit(3)
end
def self.rent
    where(status: 'Rent').select([:title, :price,:bed,:bath,:description,:id,])
end

def self.buy
    where(status: 'Sale').select([:title, :price,:bed,:bath,:description,:id])
end

def self.eight
    limit(8)
end

def self.recent
    order("created_at DESC")
end

 def self.rand
    order("random()")
 end 
 
end

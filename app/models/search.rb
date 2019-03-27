class Search < ApplicationRecord
	  
      def search_listings
          listings = Listing.all
          listings = listings.where(["status like ?",status]) if status.present?
          listings = listings.where(["location like ?",area]) if location.area?

          return listings 
   
      end	

end

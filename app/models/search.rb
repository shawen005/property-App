class Search < ApplicationRecord
   
 def lists

 	@lists ||= find_lists
   
  end		

 private

 def find_lists

 	lists = Listing.order(:location)
 	lists = lists.where("location like ?", "%#{areas} %") if areas.present?
 	lists = lists.where(status:,status) if status.present?
 	lists = lists.where("price <= ?", min_price) if min_price.present?
    lists = lists.where("price <= ?", max_price) if max_price.present?
    lists

 

 

 
 end



end

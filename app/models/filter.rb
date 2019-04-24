class Filter < ApplicationRecord
	def lists

 	@lists ||= find_lists
   
  end		

 private

 def find_lists

 	lists = Listing.order(:id)
 	lists = lists.where(location:area) if area.present?
 	lists = lists.where(status:status) if status.present?
 	lists = lists.where(bed:bed) if bed.present?
 	lists = lists.where(bath:bath) if bath.present?
 	lists = lists.where("price <= ?", min_price) if min_price.present?
    lists = lists.where("price <= ?", max_price) if max_price.present?
    lists

 

 

 
 end
end

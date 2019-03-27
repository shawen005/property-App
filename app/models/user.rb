class User < ApplicationRecord

  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
 # petergate(roles: [:admin, :editor], multiple: false)   
   petergate(roles: [:site_admin], multiple: false)                                          ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :avatar, AvatarUploader

  # User Avatar Validation validates_integrity_of :avatar validates_processing_of :avatar



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 validates_presence_of :account,:name,:phone,:avatar,:roles

 has_many :comments, dependent: :destroy

  has_many :listings, dependent: :destroy

 def first_name
   self.name
 end

 def last_name
  self.name
 end

def self.agent
  where(account: 'Agent').select([:name, :phone,:email,:avatar,:roles,:id])
 end

def self.agency
  where(account: 'Agency').select([:name, :phone,:email,:avatar,:roles,:id])
 end 


end

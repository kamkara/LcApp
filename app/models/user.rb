class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    ###############  RELATIONS    ################## 
  has_many :courses
  has_many :materials
  has_many :levels  
  has_many :cityAreas
  #has_many :exercices

     ################## VALIDATES  ###############
  validates :first_name, :last_name, :full_name, :matricule, :email, :contact, :role,  presence: true
  validates :full_name,  length: { minimum:5 }
  validates :contact,  length: { minimum:10 }
  validates :matricule,  length: { minimum:9 }


 ############# customize fields###############"" 
def email
  self.email = "#{self.contact}@gmail.com"
end

  def password
   self.password = "#{self.matricule}" 
  end

  
  def full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end
  def slug
    self.slug = self.full_name
  end

     ################## SLUG ###############
  extend FriendlyId
    friendly_id :full_name, use: :slugged

  def should_generate_new_friendly_id?
    full_name_changed?
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, authentication_keys: [:logged]


  attr_writer :logged
    ###############  RELATIONS    ################## 
  has_many :courses
  has_many :materials
  has_many :levels  
  has_many :cityAreas
  #has_many :exercices

     ################## VALIDATES  ###############
  validates :first_name, :last_name, :full_name, :matricule, :email, :contact, :role,  presence: true
  validates :full_name,  length: { minimum:5 }
  validates :contact, uniqueness: true, length: { minimum:10 }
  validates :matricule, uniqueness: true, length: { minimum:9 }

 ############# customize fields###############"" 
def email
  self.email = "#{self.matricule}@gmail.com"
end

  def password
   self.password = "#{self.contact}" 
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

  def logged
    @logged || self.matricule || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if logged = conditions.delete(:logged)
        where(conditions.to_h).where(["lower(matricule) = :value OR lower(email) = :value", { :value => logged.downcase }]).first
      elsif conditions.has_key?(:matricule) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

end

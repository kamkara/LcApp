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
  has_many :cityareas



  #before_commit :customizeStudentEmail
  #before_commit :customizeTeacherEmail
  #before_commit :password
  #before_commit :full_name
  #before_commit :slug
################## VALIDATES  ###############
validates :card_number, presence: true, if: :paid_with_card?

  def paid_with_card?
    payment_type == "card"
  end
     ################## VALIDATES SIGN UP ###############
     validates :first_name,
                :last_name, 
                :full_name,
                :email,
                :city,
                :contact,
                :role,  presence: true
validates :matricule, presence: true, if: :current_user_role?

def current_user_role?
  if self.role === 'student'
  validates :matricule, length: {is: 9}
  self.email = "#{self.matricule}@gmail.com" 
  end
end




validates :role, inclusion: { in: %w(Student Professeur Team),
    message: "%{value} nous ne savons pas qui vous etes" }


     validates :full_name,  length: { minimum:5 }
     validates :contact,
                uniqueness: true,
                length: { is:10 , wrong_length: "%{count} le numéro doit etre de 10 chiffres" }

     validates :matricule,
                uniqueness: true,
                length: { is: 9, wront_length: "%{ count} votre matricule doit etre de 9 caracteres" }

   
     ################## VALIDATES SIGN UP COMPLET ###############
     def customizeStudentEmail
      if self.role == "Student"
       validates :school_name, :serie_bac, :status_bac, presence:true      
       self.email = "#{self.matricule}@gmail.com"
      end
     end

 ############# customize fields ############### 
def customizeTeacherEmail
  if self.role == "Professeur"
    self.email = self.matricule
  end
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



  #################### Sign in section #############
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

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :author
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :authentication_keys => [:login]

  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    } # etc.

  # mount_uploader :image, :ImageUploader
  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  # added by qicaisheng 20150524
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    if login = conditions.delete(:login)
      # where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      # where(conditions.to_h).first
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end



end

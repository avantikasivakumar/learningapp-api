class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :email, format: URI::MailTo::EMAIL_REGEXP
         validates_presence_of :name, :email, :mobile, :dob, :password
         has_and_belongs_to_many :course

  def self.authenticate(email,password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
  
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password

  #attr_accessible :name, :username, :email, :password, :password_confirmation

  validates_uniqueness_of :email, :username
end

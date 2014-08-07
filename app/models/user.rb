class User < ActiveRecord::Base
  self.table_name = "vs_users"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :encrypted_password, :email, :password
end

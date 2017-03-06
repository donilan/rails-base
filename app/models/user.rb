class User < ApplicationRecord
  # Include default devise modules. Others available are:

  devise :database_authenticatable,
         :rememberable, :trackable, :validatable#, :confirmable, :lockable, :timeoutable, :recoverable, :registerable#, :omniauthable

  include DeviseLogin
  include TokenAuthable
end

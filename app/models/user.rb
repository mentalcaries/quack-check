class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  validates :first_name, presence: true, length: {minimum: 3, maximum: 25}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 25}


end

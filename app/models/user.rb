class User < ApplicationRecord
  has_many :user_identities

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable,
           :validatable, :omniauthable, omniauth_providers: [:lyft]

end

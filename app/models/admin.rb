class Admin < ApplicationRecord
  # This is based in ActiveRecord::Enum module
  enum status: { 
    actived: 'actived'
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Associations
  has_many :auctions, class_name: 'Auction'

  # Validates
  validates :display_name, presence: true
  validates :email, presence: true
end

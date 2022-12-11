require 'bcrypt'
require_relative '../utils/auth_jwt'

class Driver < ActiveRecord::Base
  include BCrypt

  has_many :rides, dependent: :destroy

  enum status: { available: 'available', occupied: 'occupied' }
    
  validates :name, :number_plate, presence: true
  validates_presence_of :password, message: "can't be blank"

  def password
    @password ||= Password.new(password_hash) if password_hash.present?
  end

  def password=(new_password)
    if new_password.present?
      @password = Password.create(new_password) 
      self.password_hash = @password
    end
  end

  def generate_token
    self.token = AuthJwt::generate_token({ id: self.id }) if self.id
  end
end

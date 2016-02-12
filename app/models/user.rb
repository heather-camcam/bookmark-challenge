require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,               Serial
  property :email,            String
  property :password_digest,  Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password #, :confirm => :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end

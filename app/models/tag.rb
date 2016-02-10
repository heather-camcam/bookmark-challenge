require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id,           Serial
  property :date_added,   DateTime
  property :name,         String
end

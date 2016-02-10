require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  property :id,         Serial
  property :tag,        String
  property :date_added,  DateTime

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

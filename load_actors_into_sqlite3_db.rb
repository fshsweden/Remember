require 'csv'    
require 'data_mapper'
require  'dm-migrations'

  # If you want the logs displayed you have to do this before the call to setup
  DataMapper::Logger.new($stdout, :debug)

  # An in-memory Sqlite3 connection:
  #DataMapper.setup(:default, 'sqlite::memory:')

  # A Sqlite3 connection to a persistent database
  DataMapper.setup(:default, 'sqlite:./db/development.sqlite3')

  # A MySQL connection:
  #DataMapper.setup(:default, 'mysql://user:password@hostname/database')

  # A Postgres connection:
  #DataMapper.setup(:default, 'postgres://user:password@hostname/database')
  
  class Person
	include DataMapper::Resource
	property :id,         Serial
	property :name,       String   # An auto-increment integer key
	property :surname,    String    # A varchar type string, for short strings
	end

	DataMapper.finalize
	DataMapper.auto_migrate!

  filename = ARGV[0] || './50000.csv'

  begin
	  CSV.foreach(filename, :headers => true) do |row|
		puts row[1] + " - " + row[0]
		p = Person.new
		p.name =row[0]
		p.surname = row[1]
		p.save!
	  end
  rescue
	  puts 'Syntax: load_actors.... <filename>'
	  puts 'Database is expected to be SQLITE3 and located in ./db/development.sqlite3'
  end

require "rubygems"
require "couchdb"

begin
	server = CouchDB::Server.new "67.23.79.113", 5984
	database = CouchDB::Database.new server, "adempsey"
	database.delete_if_exists!
	database.create_if_missing!
rescue
	puts "Error connecting to database"
end

begin
	document = CouchDB::Document.new database, "_id" => "test_document_1", "category" => "one"
	document.save
rescue
	puts "Error inserting document"
end

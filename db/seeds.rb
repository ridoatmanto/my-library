# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books_path = File.join(Rails.root, "db/initial_data_source/books.json")
books_file = File.read(books_path)
books_json = JSON.parse(books_file)

selected_books_data = [
	"id",
	"title",
	"year",
	"pages",
	"plot",
	"copyright",
	"description",
	"language",
	"release_date",
	"cover",
	"summary",
	"classes"
]
books = []

books_json['books'].each do |book|
	new_book = {}
	book.each do |key, value|
		new_book[key.to_sym] = value if selected_books_data.include? key
		new_book[key.to_sym] = value.join(',') if key == 'classes'
	end

	books.push(new_book)
end

authors_path = File.join(Rails.root, "db/initial_data_source/authors.json")
authors_file = File.read(authors_path)
authors_json = JSON.parse(authors_file)

selected_authors_data = [
	"id",
	"name",
	"gender",
	"bio",
	"born",
	"died",
	"summary"
]
authors = []
book_authors = []

authors_json['authors'].each do |author|
	new_author = {}
	author.each do |key, value|
		new_author[key.to_sym] = value if selected_authors_data.include? key
		book_authors += author['books'].map{|x| {author_id: author['id'], book_id: x}} if key == "books"
	end

	authors.push(new_author)
end

puts "-" * 64;
puts "Starting \"My Library\" Data Seeder: ";
puts "\n"
print "Importing Books... "
print "#{books.size} saved." if Book.create(books)
puts "\n"
print "Importing Authors... "
print "#{authors.size} saved." if Author.create(authors)
puts "\n"
print "Importing Book Authors... "
print "#{book_authors.size} saved." if BookAuthor.create(book_authors)
puts "\n\n"
puts "Data Seeder has finished. Thank you!";
puts "-" * 64;
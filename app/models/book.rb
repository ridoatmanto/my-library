class Book < ApplicationRecord
	has_many :book_author

  scope :filter_by_author_id, -> (author_id) {
  	# includes has better performance than joins
  	# accumulate related IDs before excute
  	includes(:book_author).where(book_authors: {author_id: author_id})
  }
  scope :filter_by_year, -> (year) { where year: year }
  scope :filter_by_minimum_book_page, -> (book_page) { 
  	where(Book.arel_table[:pages].gteq(book_page.to_i))
  }
  scope :filter_by_maximum_book_page, -> (book_page) { 
  	where(Book.arel_table[:pages].lteq(book_page.to_i))
  }

end

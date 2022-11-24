class Book < ApplicationRecord
	has_many :book_author
	
  scope :filter_by_author_id, -> (author_id) {
  	joins(:book_author).where(book_authors: {author_id: author_id})
  }
  scope :filter_by_year, -> (year) { where year: year }
  scope :filter_by_minimum_book_page, -> (book_page) { 
  	where("page >= ", book_page)
  }
  scope :filter_by_maximum_book_page, -> (book_page) { 
  	where("page <= ", book_page)
  }
  scope :filter_by_range_book_page, -> (book_page_min, book_page_max) { 
  	where("page >= ? AND page <= ?", book_page_min, book_page_max)
  }
end

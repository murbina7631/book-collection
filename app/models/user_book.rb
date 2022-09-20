class UserBook < ApplicationRecord
	has_many :books, through: :user_books
	has_many :user_books
end

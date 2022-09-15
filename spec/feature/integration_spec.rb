# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Blue Giant'
	fill_in 'Author', with: 'Shinichi Ishizuka'
	fill_in 'Price', with: '19.99'
	fill_in 'Published Date', with: '2020-11-10'
	click_on 'Create Book'
	visit books_path
	expect(page).to have_content('Blue Giant')
	expect(page).to have_content('Shinichi Ishizuka')
	expect(page).to have_content('19.99')
	expect(page).to have_content('2020-11-10')
  end
end
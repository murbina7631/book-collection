# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Fullmetal Alchemist'
    fill_in 'Author', with: 'Hiromu Arakawa'
    fill_in 'Price', with: '9.99'
    fill_in 'Published date', with: '2002-01-22'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Fullmetal Alchemist')
  end
end

RSpec.describe 'Reading a book', type: :feature do
  scenario 'show inputs' do
    visit new_book_path
    fill_in 'Title', with: 'A Silent Voice'
    fill_in 'Author', with: 'Yoshitoki Oima'
    fill_in 'Price', with: '10.99'
    fill_in 'Published date', with: '2015-05-26'
	click_on 'Create Book'
	visit book_path(Book.find_by_title('A Silent Voice'))
    expect(page).to have_content('A Silent Voice')
	expect(page).to have_content('Yoshitoki Oima')
	expect(page).to have_content('10.99')
	expect(page).to have_content('2015-05-26')
  end
end

RSpec.describe 'Updating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Red Giant'
    fill_in 'Author', with: 'Ishizuka Shinichi'
    fill_in 'Price', with: '19.99'
    fill_in 'Published date', with: '2020-11-10'
	click_on 'Create Book'
	visit edit_book_path(Book.find_by_title('Red Giant'))
	fill_in 'Title', with: 'Blue Giant'
    fill_in 'Author', with: 'Shinichi Ishizuka'
    fill_in 'Price', with: '19.99'
    fill_in 'Published date', with: '2020-11-10'
	click_on 'Update Book'
	visit books_path
    expect(page).to have_content('Blue Giant')
  end
end

RSpec.describe 'Deleting a book', type: :feature do
  scenario 'delete inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Sakurai-san Wants to be Noticed'
    fill_in 'Author', with: 'Akinosora'
    fill_in 'Price', with: '13.99'
    fill_in 'Published date', with: '2022-07-26'
	click_on 'Create Book'
	visit books_path
	expect(page).to have_content('Sakurai-san Wants to be Noticed')
	click_link 'Delete: Destroy'
    expect(page).not_to have_content('Sakurai-san Wants to be Noticed')
  end
end
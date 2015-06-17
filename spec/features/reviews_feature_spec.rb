require 'rails_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'reviewing' do
  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    sign_in
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'animal cruelty - stay away!'
    select '1', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('animal cruelty - stay away!')
  end

  scenario 'displays an average rating for all reviews' do
    sign_in
    leave_review('So so', '3')
    click_link 'Sign out'
    sign_in2
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: 4')
  end

end

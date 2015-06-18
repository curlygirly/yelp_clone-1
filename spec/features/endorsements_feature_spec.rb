require 'rails_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    sign_in
    click_link 'Endorse this review'
    expect(page).to have_content('1 endorsement')
  end

end
require 'rails_helper'
require_relative 'helpers/session'
include SessionHelpers


feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it "should not see 'Add a restaurant' link" do
      visit('/')
      expect(page).not_to have_link('Add a restaurant')
    end


  end

  context 'user signed in on the homepage' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
    end

    it "should see 'sign out' link" do
      visit('/')
      sign_in
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      sign_in
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end

# feature ' User editing rights' do
#   context 'user is signed in and on the homepage' do
#     it "and can only leave one review per restaurant" do
#     visit ('/')
#     sign_in
#     create_restaurant('Duck & Waffle')
#     visit '/restaurants'
#     click_link 'Review Duck & Waffle'
#     fill_in 'Thoughts', with: 'Duck & Waffle awesome combo - who knew??'
#     select '4', from: 'Rating'
#     click_button 'Leave Review'
#     expect(page).to have_content 'Duck & Waffle awesome combo - who knew??'
#     expect(page).not_to have_link('Review Duck & Waffle')
#     end
#   end
# end

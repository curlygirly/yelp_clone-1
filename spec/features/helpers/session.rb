module SessionHelpers
  def sign_in
    User.create(email: 'test@test.com', password: 'test1234')
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test1234'
    click_button 'Log in'
    visit '/restaurants'
  end

  def sign_in2
    User.create(email: 'testes@test.com', password: 'test1234')
    visit '/users/sign_in'
    fill_in 'Email', with: 'testes@test.com'
    fill_in 'Password', with: 'test1234'
    click_button 'Log in'
     visit '/restaurants'
  end

  def create_restaurant(name)
    Restaurant.create name: name
  end

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

end

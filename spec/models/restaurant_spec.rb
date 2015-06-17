require 'spec_helper'

describe Restaurant, :type => :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
describe Restaurant, type: :model do
  it { is_expected.to have_many(:reviews).dependent(:destroy) }
end

describe '#average_rating' do
  context 'no reviews' do
    it 'returns "N/A" when there are no reviews' do
      restaurant = Restaurant.create(name: 'The Ivy')
      expect(restaurant.average_rating).to eq 'N/A'
    end
  end

  context '1 review' do
    it 'returns that rating' do
      restaurant = Restaurant.create(name: 'The Ivy')
      restaurant.reviews.create(rating: 4)
      expect(restaurant.average_rating).to eq 4
    end
  end

  context 'multiple reviews' do

    let(:user1) {User.create(email: 'trial@trail.com', password: 'trial1234')}
    let(:user2) {User.create(email: 'tail@tail.com', password: 'tial01234')}

    it 'returns the average' do
      restaurant = Restaurant.create(name: 'The Ivy')
      restaurant.reviews.create(user: user1, rating: 1)
      restaurant.reviews.create(user: user2, rating: 5)
      expect(restaurant.average_rating).to eq 3
    end
  end

end

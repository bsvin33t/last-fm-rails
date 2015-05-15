require 'rails_helper'

RSpec.describe Search, type: :model do
  let(:user) { create(:user) }

  describe 'initialize' do
    it 'should create a search history object when a new object is initialized' do
      expect { Search.new('query', user) }.to change { SearchHistory.count }.by(1)
    end
  end

  describe 'similar_artists' do
    it 'should fetch a list of artists similar to Megadeth' do
      VCR.use_cassette('Megadeth') do
        search_result = Search.new('Megadeth', user).similar_artists
        expect(search_result.to_s).to include('Metallica', 'Slayer')
      end
    end
  end


end

require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'associations' do
    it { belong_to(:pessoa) }
  end
end

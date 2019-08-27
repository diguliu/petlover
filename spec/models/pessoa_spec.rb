require 'rails_helper'

RSpec.describe Pessoa, type: :model do
  describe 'associations' do
    it { have_many(:animais) }
  end
end

require 'rails_helper'
require_relative '../../app/services/string_calculator'

RSpec.describe StringCalculator, type: :service do

  describe '#add' do
    context 'when the input is empty' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'when the input is one number' do
      it 'returns 1' do
        expect(StringCalculator.add('1')).to eq(1)
      end
    end

    context 'when the input is two numbers' do
      it 'returns  2' do
        expect(StringCalculator.add('1,5')).to eq(2)
      end
    end
  end
end
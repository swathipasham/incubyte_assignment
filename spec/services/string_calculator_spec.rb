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
      it 'returns number' do
        expect(StringCalculator.add('1')).to eq(1)
      end
    end

    context 'when the input is two numbers' do
      it 'returns sum of the numbers' do
        expect(StringCalculator.add('1,5')).to eq(6)
      end
    end

    context 'when the input is more than 2 numbers' do
      it 'returns the sum of multiple numbers' do
        expect(StringCalculator.add("1,2,3,4,5,1,2,3")).to eq(21)
       end
    end

    context 'when the input has new line character' do
      it 'returns the sum of the numbers' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end
  end
end
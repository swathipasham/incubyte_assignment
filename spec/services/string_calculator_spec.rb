require 'rails_helper'

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

    context 'when the input delimiters' do
      it 'returns the sum of the numbers when the input is different delimeters ' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

       it 'returns the sum when delimeters can be any length' do 
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end

      it 'returns the sum when there are multiple delimeters' do
        expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context 'when the input has negative numbers' do
      it 'throws an exception when negative number is present' do
        expect { StringCalculator.add("1,-2") }.to raise_error(StandardError, 'negative numbers not allowed: -2')

      end
      it 'throws an exception whem multiple negative numbers are present' do
        expect { StringCalculator.add("1,-2, -4, -2") }.to raise_error(StandardError, 'negative numbers not allowed: -2, -4, -2')
      end
    end

    context 'when the input has numbers greater than 1000' do 
      it 'ignores numbers greater than 1000' do
        expect(StringCalculator.add("1,1001")).to eq(1)
      end
    end

  end
end
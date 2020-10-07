require 'spec_helper'

describe Commands::Integer do
  subject { described_class.new(input) }

  it 'should be subclasses of Commands::Base' do
    expect(described_class).to be < ::Commands::Base
  end

  describe '#can_process?' do
    context 'above zero' do
      let(:input) { '123' }
      it { expect(subject.can_process?).to be_truthy }
    end

    context 'below zero' do
      let(:input) { '-123' }
      it { expect(subject.can_process?).to be_truthy }
    end

    context 'incorrect' do
      context '*' do
        let(:input) { '*' }
        it { expect(subject.can_process?).to be_falsey }
      end

      context 'letters' do
        let(:input) { 'aa' }
        it { expect(subject.can_process?).to be_falsey }
      end

      context 'letters and numbers' do
        let(:input) { 'aa123' }
        it { expect(subject.can_process?).to be_falsey }
      end

      context 'float number' do
        let(:input) { '123.45' }
        it { expect(subject.can_process?).to be_falsey }
      end
    end
  end

  describe '#process' do
    let(:input) { '123' }
    let(:value1) { 10 }
    let(:value2) { 20 }

    it 'returns input.to_i and disregards values' do
      expect(subject.process(value1, value2)).to eq(input.to_i)
    end
  end
end

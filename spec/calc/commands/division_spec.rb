require 'spec_helper'

describe Commands::Division do
  subject { described_class.new(input) }

  it 'should be subclasses of Commands::Base' do
    expect(described_class).to be < ::Commands::Base
  end

  describe '#can_process?' do
    context 'correct' do
      let(:input) { '/' }
      it { expect(subject.can_process?).to be_truthy }
    end

    context 'incorrect' do
      context '-' do
        let(:input) { '-' }
        it { expect(subject.can_process?).to be_falsey }
      end

      context 'number' do
        let(:input) { '123' }
        it { expect(subject.can_process?).to be_falsey }
      end

      context '//' do
        let(:input) { '//' }
        it { expect(subject.can_process?).to be_falsey }
      end
    end
  end

  describe '#process' do
    let(:input) { '/' }
    let(:value1) { 10 }
    let(:value2) { 20 }

    it 'returns value1 divided on value2' do
      expect(subject.process(value1, value2)).to eq(value1 / value2.to_f)
    end
  end
end

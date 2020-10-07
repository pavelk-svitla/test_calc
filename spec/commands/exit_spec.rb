require 'spec_helper'

describe Commands::Exit do
  subject { described_class.new(input) }

  it 'should be subclasses of Commands::Base' do
    expect(described_class).to be < ::Commands::Base
  end

  describe '#can_process?' do
    context 'empty' do
      let(:input) { '' }
      it { expect(subject.can_process?).to be_truthy }
    end

    context '^D' do
      let(:input) { '^D' }
      it { expect(subject.can_process?).to be_truthy }
    end

    context '^C' do
      let(:input) { '^D' }
      it { expect(subject.can_process?).to be_truthy }
    end

    context 'q' do
      let(:input) { 'q' }
      it { expect(subject.can_process?).to be_truthy }
    end

    context 'incorrect' do
      context 'number and q' do
        let(:input) { '123q' }
        it { expect(subject.can_process?).to be_falsey }
      end

      context 'qq' do
        let(:input) { 'qq' }
        it { expect(subject.can_process?).to be_falsey }
      end
    end
  end

  describe '#process' do
    let(:input) { 'q' }
    let(:value1) { 10 }
    let(:value2) { 20 }

    it 'returns nil' do
      expect(subject.process(value1, value2)).to be_nil
    end
  end
end

require 'spec_helper'

describe Listener do
  let(:input) { '' }
  subject { described_class.new(input) }

  it 'should define call' do
    expect(subject.respond_to?(:call)).to be_truthy
  end

  describe 'instance' do
    it 'call should not raise error' do
      expect { subject.call }.not_to raise_error
    end

    context '\n' do
      let(:input) { "123\n" }

      it 'call should remove \n' do
        expect(subject.call).to eq '123'
      end
    end

    context 'spaces on beginning and end' do
      let(:input) { " 123 " }

      it 'call should remove spaces' do
        expect(subject.call).to eq '123'
      end
    end

    context 'spaces within' do
      let(:input) { "1 2 3" }

      it 'call should not remove spaces' do
        expect(subject.call).to eq '1 2 3'
      end
    end
  end
end

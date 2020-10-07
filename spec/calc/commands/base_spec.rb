require 'spec_helper'

describe Commands::Base do
  subject { described_class.new('') }

  it 'should define can_process?' do
    expect(subject.respond_to?(:can_process?)).to be_truthy
  end

  it 'should define process' do
    expect(subject.respond_to?(:process)).to be_truthy
  end

  describe 'instance' do
    it 'can_process? should not raise error' do
      expect { subject.can_process? }.not_to raise_error
    end

    it 'can_process? should return false' do
      expect(subject.can_process?).to be_falsey
    end

    it 'process should raise NotImplementedError' do
      expect { subject.process(nil, nil) }.to raise_error(NotImplementedError)
    end
  end
end

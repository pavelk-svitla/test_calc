require 'spec_helper'

describe Processor do
  let(:input) { '+' }
  let(:value1) { 3 }
  let(:value2) { 2 }
  subject { described_class.new(input, [value1, value2]) }

  it 'should define call' do
    expect(subject.respond_to?(:call)).to be_truthy
  end

  it 'should define exit?' do
    expect(subject.respond_to?(:call)).to be_truthy
  end

  describe '#call' do
    let(:command) { double }
    let(:commands) { [command] }

    before do
      allow(command).to receive(:new) { command }
      stub_const('::Commands::AVAILABLE', commands)
    end

    context 'command is responsive' do
      let(:response) { rand }

      before do
        allow(command).to receive(:can_process?) { true }
      end

      it 'finds command' do
        expect(subject.command).to eq(command)
      end

      it 'calls process on command' do
        expect(command).to receive(:process).with(value1, value2) { response }
        subject.call
      end

      it 'responds with command result' do
        allow(command).to receive(:process).with(value1, value2) { response }
        expect(subject.call).to eq(response)
      end
    end

    context 'command is not responsive' do
      before do
        allow(command).to receive(:can_process?) { false }
      end

      it 'command is empty' do
        expect(subject.command).to eq(nil)
      end

      it 'raise NotImplementedError' do
        expect { subject.call }.to raise_error(NotImplementedError)
      end
    end
  end

  describe '#exit?' do
    let(:command) { double }
    let(:commands) { [command] }

    before do
      allow(command).to receive(:new) { command }
      stub_const('::Commands::AVAILABLE', commands)
      stub_const('::Commands::Exit', double)
    end

    context 'command is responsive' do
      let(:response) { true }

      before do
        allow(command).to receive(:can_process?) { true }
      end

      it 'finds command' do
        expect(subject.command).to eq(command)
      end

      it 'checks class on command' do
        expect(command).to receive(:==).with(Commands::Exit) { response }
        subject.exit?
      end

      it 'responds with comparison result' do
        expect(command).to receive(:==).with(Commands::Exit) { response }
        expect(subject.exit?).to eq(response)
      end
    end
  end
end

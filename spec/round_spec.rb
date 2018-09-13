require 'spec_helper'
require_relative '../round'
require_relative '../die'

describe Round do
  describe '#initialize' do
    let(:round) { Round.new }
    before do
      allow(Die).to receive(:new) { instance_double('Die') }
    end
    it 'has five dice' do
      expect(round.dice.length).to eq 5
    end
  end

  describe '#roll' do
    before do
      @dice = Array.new(5) { instance_double('Die') }
      allow(Die).to receive(:new) { @dice.shift }
    end
    let(:round) { Round.new }
    it 'rolls all of the die if no holds are specified' do
      @dice.each do |die|
        expect(die).to receive(:roll)
      end
      round.roll
    end
    it 'rolls all of the die except those that are held' do
      @dice[1..-1].each do |die|
        expect(die).to receive(:roll)
      end
      round.roll([0])
    end
  end
end

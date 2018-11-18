require 'game'

describe Game do

  subject(:game) { described_class.new(human, computer) }
  let(:human)    { double(:human)  }
  let(:computer) { double(:computer)  }

  describe '#self.create' do
    it 'created a new instance of self' do
      expect(Game.create(human, computer)).to be_an_instance_of described_class
    end
  end

  describe '#self.instance' do
    it 'allows us to access an instance of Player' do
      new_game = Game.create(human, computer)
      expect(Game.instance).to eq new_game
    end
  end

  describe '#players' do
    it 'has player 1' do
      expect(game.player_1).to eq human
    end
    it 'has player 2' do
      expect(game.player_2).to eq computer
    end
  end

  describe '#winner' do
    it 'player 1 wins' do
      player_1 = double(:player_1, weapon: 'rock')
      player_2 = double(:player_2, weapon: 'scissor')
      game = described_class.new(player_1, player_2)
      expect(game.winner(player_1.weapon, player_2.weapon)).to eq player_1
    end

    it 'player 2 wins' do
      player_1 = double(:player_1, weapon: 'rock')
      player_2 = double(:player_2, weapon: 'paper')
      game = described_class.new(player_1, player_2)
      expect(game.winner(player_1.weapon, player_2.weapon)).to eq player_2
    end
  end

end
class GameController < ApplicationController


  # [url] GET game(.:format)
  def index
  end

  # [url] GET game/:id/show(.:format)
  def show
  end

  # [url] GET game/new(.:format)
  def new
  end

  # [url] POST game/create(.:format)
  def create
  end

  # [url] GET game/:id/edit(.:format)
  def edit
  end

  # [url] PUT game/:id(.:format)
  def update
  end

  # [url] DELETE game/:id(.:format)
  def destroy
  end

  # [url] PUT game/:game_id/join(.:format)
  def join
  end

  # [url] GET game/:game_id/play(.:format)
  def play
    @board = Board.new
    @hand = Hand.new

    @hand.cards << Card.new(rank: 1, suit: :spades)
    @hand.cards << Card.new(rank: 2, suit: :hearts)
    @hand.cards << Card.new(rank: 3, suit: :spades)

  end

  def draw_card
    #todo: this action should be moved to a different controller PlayerController?

    card = Card.new(rank: Random.rand(13) + 1, suit: :hearts)

    respond_with(rank: card.rank, suit: card.suit_value)
  end
end

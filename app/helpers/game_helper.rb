require_relative '../../lib/utils/token'

module GameHelper

  def show_board(board)
    content_tag :div, id: 'board' do
      board.decks.each do |deck|
        concat show_deck(deck)
      end
    end

    #concat content_tag(:script, hand.cards.map {|c| show_card(c)}.join.html_safe, type: "text/javascript")
  end

  def show_deck(deck)
    content_tag :div, id: deck.client_id do
      deck.cards.each do |card|
        concat show_card(card)
      end
    end

    concat content_tag(:script, "$(function() {$('#%s').deck().collapse();});" % [deck.client_id], type: "text/javascript")
  end

  def show_card(card)
    "$('\#%s').card({rank: %s, suit: %s});\n" % [card.client_id, card.rank, card.suit_value]
  end

  def show_player_hand(hand)
    content_tag(:div, id: 'player-hand') do
      hand.cards.each do |card|
          concat(content_tag(:div, '', id: card.client_id)) do
        end
      end

      concat content_tag(:script, hand.cards.map {|c| show_card(c)}.join.html_safe, type: "text/javascript")
    end
  end
end
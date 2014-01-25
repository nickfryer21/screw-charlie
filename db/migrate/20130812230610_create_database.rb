class CreateDatabase < ActiveRecord::Migration
  def change
      create_table 'boards', :force => true do |t|
        t.integer 'game_id'
      end

      create_table 'cards', :force => true do |t|
        t.integer 'rank'
        t.string 'suit'
        t.integer 'sequence'
        t.string 'pile_type'
        t.integer 'pile_id'
      end

      create_table 'decks', :force => true do |t|
        t.integer 'board_id'
      end

      add_index 'decks', ['board_id'], :name => 'index_decks_on_board_id'

      create_table 'draw_cards', :force => true do |t|
        t.integer 'draw_pile_id'
        t.integer 'hand_id'
      end

      add_index 'draw_cards', ['draw_pile_id'], :name => 'index_draw_cards_on_draw_pile_id'
      add_index 'draw_cards', ['hand_id'], :name => 'index_draw_cards_on_hand_id'

      create_table 'draw_piles', :force => true do |t|
        t.integer 'game_id'
      end

      add_index 'draw_piles', ['game_id'], :name => 'index_draw_piles_on_game_id'

      create_table 'game_players', :force => true do |t|
        t.integer 'game_id'
        t.integer 'player_id'
        t.integer 'slot_id'
      end

      add_index 'game_players', ['slot_id'], :name => 'index_game_players_on_slot_id'

      create_table 'games', :force => true do |t|
        t.datetime 'start_date'
        t.datetime 'end_date'
        t.string 'title'
        t.integer 'active_slot'
        t.boolean 'active', :default => false
      end

      create_table 'hands', :force => true do |t|
        t.integer 'game_player_id'
      end

      create_table 'move_cards', :force => true do |t|
        t.integer 'source_deck_id'
        t.integer 'target_deck_id'
        t.integer 'card_id'
      end

      create_table 'moves', :force => true do |t|
        t.integer 'turn_id'
        t.integer 'card_id'
      end

      add_index 'moves', ['card_id'], :name => 'index_moves_on_card_id'

      create_table 'play_cards', :force => true do |t|
        t.integer 'hand_id'
        t.integer 'deck_id'
      end

      add_index 'play_cards', ['deck_id'], :name => 'index_play_cards_on_deck_id'
      add_index 'play_cards', ['hand_id'], :name => 'index_play_cards_on_hand_id'

      create_table 'player_actions', :force => true do |t|
        t.integer 'turn_id'
        t.string 'action_type'
        t.integer 'action_id'
      end

      add_index 'player_actions', ['turn_id'], :name => 'index_player_actions_on_turn_id'

      create_table 'player_sessions', :force => true do |t|
        t.integer 'player_id'
        t.string 'token', :limit => 32
        t.datetime 'created_at', :null => false
        t.datetime 'updated_at', :null => false
        t.integer 'game_id'
      end

      add_index 'player_sessions', ['game_id'], :name => 'index_player_sessions_on_game_id'
      add_index 'player_sessions', ['player_id'], :name => 'index_player_sessions_on_player_id'

      create_table 'players', :force => true do |t|
        t.string 'screen_name'
      end

      create_table 'slots', :force => true do |t|
        t.integer 'game_id'
        t.boolean 'available', :default => true
        t.integer 'sequence'
      end

      add_index 'slots', ['game_id'], :name => 'index_slots_on_game_id'

      create_table 'turns', :force => true do |t|
        t.integer 'game_player_id'
      end

      add_index 'turns', ['game_player_id'], :name => 'index_turns_on_game_player_id'
    end
end

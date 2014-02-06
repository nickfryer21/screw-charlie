# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140206043125) do

  create_table "boards", force: true do |t|
    t.integer "game_id"
    t.string  "client_id", limit: 16
  end

  create_table "cards", force: true do |t|
    t.integer "rank"
    t.string  "suit"
    t.integer "sequence"
    t.string  "pile_type"
    t.integer "pile_id"
    t.string  "client_id", limit: 16
  end

  create_table "decks", force: true do |t|
    t.integer "board_id"
    t.string  "client_id", limit: 16
  end

  add_index "decks", ["board_id"], name: "index_decks_on_board_id", using: :btree

  create_table "draw_cards", force: true do |t|
    t.integer "draw_pile_id"
    t.integer "hand_id"
  end

  add_index "draw_cards", ["draw_pile_id"], name: "index_draw_cards_on_draw_pile_id", using: :btree
  add_index "draw_cards", ["hand_id"], name: "index_draw_cards_on_hand_id", using: :btree

  create_table "draw_piles", force: true do |t|
    t.integer "game_id"
  end

  add_index "draw_piles", ["game_id"], name: "index_draw_piles_on_game_id", using: :btree

  create_table "game_players", force: true do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "slot_id"
  end

  add_index "game_players", ["slot_id"], name: "index_game_players_on_slot_id", using: :btree

  create_table "games", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "title"
    t.integer  "active_slot"
    t.boolean  "active",      default: false
  end

  create_table "hands", force: true do |t|
    t.integer "game_player_id"
  end

  create_table "move_cards", force: true do |t|
    t.integer "source_deck_id"
    t.integer "target_deck_id"
    t.integer "card_id"
  end

  create_table "moves", force: true do |t|
    t.integer "turn_id"
    t.integer "card_id"
  end

  add_index "moves", ["card_id"], name: "index_moves_on_card_id", using: :btree

  create_table "play_cards", force: true do |t|
    t.integer "hand_id"
    t.integer "deck_id"
  end

  add_index "play_cards", ["deck_id"], name: "index_play_cards_on_deck_id", using: :btree
  add_index "play_cards", ["hand_id"], name: "index_play_cards_on_hand_id", using: :btree

  create_table "player_actions", force: true do |t|
    t.integer "turn_id"
    t.string  "action_type"
    t.integer "action_id"
  end

  add_index "player_actions", ["turn_id"], name: "index_player_actions_on_turn_id", using: :btree

  create_table "player_sessions", force: true do |t|
    t.integer  "player_id"
    t.string   "token",      limit: 32
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "game_id"
  end

  add_index "player_sessions", ["game_id"], name: "index_player_sessions_on_game_id", using: :btree
  add_index "player_sessions", ["player_id"], name: "index_player_sessions_on_player_id", using: :btree

  create_table "players", force: true do |t|
    t.string "screen_name"
    t.string "password",    limit: 20
  end

  create_table "slots", force: true do |t|
    t.integer "game_id"
    t.boolean "available", default: true
    t.integer "sequence"
  end

  add_index "slots", ["game_id"], name: "index_slots_on_game_id", using: :btree

  create_table "turns", force: true do |t|
    t.integer "game_player_id"
  end

  add_index "turns", ["game_player_id"], name: "index_turns_on_game_player_id", using: :btree

end

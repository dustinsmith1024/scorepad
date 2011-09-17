class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user
      t.references :game
      t.boolean :winner
      t.integer :score

      t.timestamps
    end
    add_index :players, :user_id
    add_index :players, :game_id
  end
end

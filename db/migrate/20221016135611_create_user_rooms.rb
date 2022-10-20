# frozen_string_literal: true

class CreateUserRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :user_rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end

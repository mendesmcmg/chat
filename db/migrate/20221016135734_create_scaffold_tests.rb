# frozen_string_literal: true

class CreateScaffoldTests < ActiveRecord::Migration[7.0]
  def change
    create_table :scaffold_tests do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

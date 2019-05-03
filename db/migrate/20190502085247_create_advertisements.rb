# frozen_string_literal: true

class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.string :location
      t.string :category
      t.string :type
      t.string :model
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

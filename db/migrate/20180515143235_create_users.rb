# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest, null: false, index: true
      t.boolean :is_admin, default: false
      t.timestamps
    end
  end
end

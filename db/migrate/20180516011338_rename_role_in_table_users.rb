# frozen_string_literal: true

class RenameRoleInTableUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :role, :string
    add_column :users, :is_admin, :boolean
  end
end

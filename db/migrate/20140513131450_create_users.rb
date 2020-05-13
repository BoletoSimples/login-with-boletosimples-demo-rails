# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :full_name
      t.string :email
      t.string :access_token

      t.timestamps
    end
  end
end

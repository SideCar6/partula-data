class CreateGivenNames < ActiveRecord::Migration
  def change
    create_table :given_names do |t|
      t.string  :name
      t.string  :gender
      t.integer :year
      t.integer :count
      t.string  :country_code

      t.timestamps
    end

    add_index :given_names, [:name, :gender, :year, :country_code], unique: true
    add_index :given_names, [:gender]
    add_index :given_names, [:year]
    add_index :given_names, [:count]
    add_index :given_names, [:country_code]
  end
end


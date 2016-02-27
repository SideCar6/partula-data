class CreateSurnames < ActiveRecord::Migration
  def change
    create_table :surnames do |t|
      t.string  :name
      t.integer :rank
      t.integer :count
      t.float   :pctwhite
      t.float   :pctblack
      t.float   :pctapi
      t.float   :pctaian
      t.float   :pct2prace
      t.float   :pcthispanic
      t.integer :year
      t.string  :country_code

      t.timestamps
    end

    add_index :surnames, [:name, :year, :country_code], unique: true
    add_index :surnames, [:year]
    add_index :surnames, [:country_code]
  end
end


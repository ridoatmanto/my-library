class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :gender, :limit => 1
      t.text :bio
      t.datetime :born
      t.datetime :died
      t.text :summary

      t.timestamps
    end
  end
end
